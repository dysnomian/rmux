require 'spec_helper'

RSpec.describe Rmux::Option do
  let(:string_option) { Rmux::Option.new(:fave_ship, "yuuali", :global) }

  describe "#==" do
    let(:string_option_again) { Rmux::Option.new(:fave_ship, "yuuali", :global) }

    it "fixes object equality" do
      expect(string_option).to eq(string_option_again)
    end
  end

  context "with a string option" do

  end
end
