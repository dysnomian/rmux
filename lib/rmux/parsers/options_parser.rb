module Rmux
  module Parsers
    class OptionsParser
      attr_reader :results

      def initialize
        @results = []
      end

      def parse(output, scope = :global)
        output.split("\n").map {|l| parse_option_line(l, scope)}
      end

      private

      def parse_option_line(line, scope)
        key, *val = line.split(" ")
        Rmux::Option.new(symbolize_key(key), parse_value(val), scope)
      end

      def symbolize_key(key)
        key.gsub("-", "_").to_sym
      end

      def symbolize_var_key(key)
        key.gsub("@", "").gsub("-", "_").to_sym
      end

      def parse_value(val)
        parsed_val = val.join(" ").gsub("\"", "")

        case
        when parsed_val == "on"
          :on
        when parsed_val == "off"
          :off
        when parsed_val == "default"
          :default
        when parsed_val == "true"
          true
        when parsed_val == "false"
          false
        else
          parsed_val
        end
      end
    end
  end
end
