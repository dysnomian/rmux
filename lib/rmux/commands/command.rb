module Rmux
  module Commands
    module Command
      def to_proc
        ->() do
          output = `tmux #{shell_command}`
          parse_output(output)
        end
      end

      def execute!
        self.to_proc.call
      end

      def parse_output(output)
        parser.parse(output)
      end
    end
  end
end
