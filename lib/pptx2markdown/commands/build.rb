require 'powerpoint'
require_relative 'base'

module Pptx2markdown
  module Commands
    class Build < Base
      attr_reader :input

      INDENT_MARKER = "\t".freeze

      def execute
        @input = open_input_file
        presentation = build_presentation
        presentation.save output_filepath
      ensure
        input && input.close
      end

      private

      def build_presentation
        presentation = Powerpoint::Presentation.new
        title = input.gets.strip
        content = []

        # read possibly large markdown file line by line in order to save memory
        input.each_line do |line|
          if line.start_with? INDENT_MARKER
            content << line.strip
          else
            # when a new title is found, we need to dump previous title with
            # content to the slide, and clear the state for the new slide
            unless title.empty?
              content.uniq! # it's not necessary, but looks better anyway
              presentation.add_textual_slide title, content
            end

            title = line.strip
            content = [] # XXX: Array#clear is better solution, but didn't work
          end
        end

        # don't forget about the last slide, collected from the loop
        last_title = presentation.slides.last.title
        presentation.add_textual_slide title, content if title != last_title

        presentation
      end

      def open_input_file
        input_file = options['input-file']

        case input_file
        when StringIO then input_file
        when String   then File.open input_filepath, 'r'
        end
      end

      def output_filepath
        output_file = options['output-file']

        return super if output_file && !output_file.empty?

        input_file = input_filepath
        extension = File.extname input_file
        pattern = Regexp.new "\\#{extension}\\Z"
        input_file.sub pattern, '.pptx'
      end
    end
  end
end
