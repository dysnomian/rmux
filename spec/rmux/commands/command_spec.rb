require 'spec_helper'

RSpec.describe Rmux::Commands::Command do
  let!(:parser) { double("Parser") }

  subject do
    class FakeCommand
      include Rmux::Commands::Command

      attr_reader :parser

      def initialize(parser)
        @parser = parser
      end

      def shell_command
        "fake-command -g"
      end
    end

    FakeCommand.new(parser)
  end

  let(:output) { "string!" }

  describe "#parse_output" do
    it "uses the parser on the parent class" do
      expect(parser).to receive(:parse).with(output)
      subject.parse_output(output)
    end
  end

  # TODO: Needs some more specific tests
  describe "#to_proc" do
    it "builds a block" do
      expect(subject.to_proc).to be_a(Proc)
    end
  end
end

