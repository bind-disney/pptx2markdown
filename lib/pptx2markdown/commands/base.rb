require 'pathname'

module Pptx2markdown
  module Commands
    class Base
      attr_reader :options

      def initialize(options)
        @options = options
      end

      def execute
        raise NotImplementedError, 'implement execute method in the subclass'
      end

      private

      def input_filepath
        normalize_filepath :input
      end

      def output_filepath
        normalize_filepath :output
      end

      def normalize_filepath(kind)
        filepath = options["#{kind}-file"]

        if filepath.nil? || filepath.empty?
          raise ArgumentError, "#{kind} file isn't specified!"
        end

        Pathname.new(filepath).expand_path.to_s
      end
    end
  end
end
