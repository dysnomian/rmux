module Rmux
  module Commands
    class ServerOptions
      attr_reader :args

      include Command

      def initialize(*args)
        @args = args
      end

      def parser
        @parser ||= Rmux::Parsers::OptionsParser.new
      end

      def shell_command
        "show-options -s"
      end
    end
  end
end
