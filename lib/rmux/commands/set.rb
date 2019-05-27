module Rmux
  module Commands
    class NotImplementedError < StandardError
    class SetOption
      attr_reader :args

      def initialize(option)
        @key   = option.key
        @value = option.value
        @scope = option.scope
      end

      def to_proc
        ->() do

        end
      end

      def parser
        @parser ||= Rmux::Parsers::OptionsParser.new
      end

      def shell_command
        case
        when scope == :global
          "set -g #{key} #{value}"
        else
          raise NotImplementedError
        end
      end

    end
  end
end
