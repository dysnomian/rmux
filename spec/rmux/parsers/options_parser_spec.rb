require 'spec_helper'

RSpec.describe Rmux::Parsers::OptionsParser do
  describe "#parse" do
    let(:output) do
      <<~OUTPUT
        @powerline on
        mouse on
        status on
        status-bg #000000
        status-fg default
      OUTPUT
    end

    let(:expected_hash) do
      {
        options: {
          mouse:     :on,
          prefix:    "C-b",
          status:    :on,
          status_bg: "#000000",
          status_fg: :default
        },
        vars: {
          powerline: :on
        }
      }
    end

    # TODO color options

    context "with a boolean option" do
      let(:output) { "immortality true" }
      let(:expected_options) do
        [Rmux::Option.new(:immortality, true, :global)]
      end

      it "creates a boolean option" do
        expect(subject.parse(output)[0]).to eq(expected_options[0])

      end
    end

    context "with a string option" do
      let(:output) { "immortality-source \"hourai elixir\"" }
      let(:expected_options) do
        [Rmux::Option.new(:immortality_source, "hourai elixir", :global)]
      end

      it "creates a string option" do
        expect(subject.parse(output)[0]).to eq(expected_options[0])

      end
    end

    context "with an on/off option" do
      let(:output) { "tewi_fuckery \"on\"" }
      let(:expected_options) do
        [Rmux::Option.new(:tewi_fuckery, :on, :global)]
      end

      it "creates an on/off option" do
        expect(subject.parse(output)[0]).to eq(expected_options[0])

      end
    end

    context "with a default value" do
      let(:output) { "kaguya-drama \"default\"" }
      let(:expected_options) do
        [Rmux::Option.new(:kaguya_drama, :default, :global)]
      end

      it "creates an option with :default value" do
        expect(subject.parse(output)[0]).to eq(expected_options[0])

      end
    end
  end
end

