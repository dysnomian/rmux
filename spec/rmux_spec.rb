RSpec.describe Rmux do
  it "has a version number" do
    expect(Rmux::VERSION).not_to be nil
  end
end

RSpec.describe Rmux::Commands::GlobalOptions do
  subject { Rmux::Commands::GlobalOptions.new }

  describe "shell_command" do
    it "builds the correct command" do
      expect(subject.shell_command).to eq("show-options -g")
    end
  end

  describe "#parse_output" do
    pending "invokes the OptionsParser"
  end
end
