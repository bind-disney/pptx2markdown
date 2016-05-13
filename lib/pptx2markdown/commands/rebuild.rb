require_relative 'base'
require_relative 'dump'
require_relative 'build'

module Pptx2markdown
  module Commands
    class Rebuild < Base
      def execute
        dump_command = Dump.new('input-file'  => input_filepath,
                                'output-file' => :stream)
        dump_command.execute

        # need to reopen IO stream on reading instead of writing,
        # because it's closed after dump command was executed
        dump_output = dump_command.output
        dump_output.reopen dump_output.string, 'r'

        build_command = Build.new('input-file'  => dump_output,
                                  'output-file' => output_filepath)
        build_command.execute
      end

      private

      def output_filepath
        filepath = input_filepath

        return filepath if replace?

        basename  = File.basename filepath
        extension = File.extname basename
        pattern   = Regexp.new "(.+)(\\#{extension})\\Z"
        timestamp = Time.now.strftime '%Y_%m_%d_%H_%M_%S'

        filepath.sub pattern, "\\1_#{timestamp}\\2"
      end

      def replace?
        options[:replace]
      end
    end
  end
end
