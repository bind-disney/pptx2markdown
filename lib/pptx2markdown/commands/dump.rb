require 'openxml/package'
require_relative 'base'

module Pptx2markdown
  module Commands
    class Dump < Base
      def execute
        input = open_input_file
        output = open_output_file
        presentation = Presentation.new input
        output.puts presentation
      ensure
        input && input.close
        output && output.close
      end

      private

      def open_input_file
        OpenXml::Package.open input_filepath
      end

      def open_output_file
        case options['output-file']
        when :stdout then STDOUT
        when String  then File.open output_filepath, 'w'
        end
      end
    end
  end
end
