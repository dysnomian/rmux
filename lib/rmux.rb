require "rmux/version"
require "rmux/option"
require "rmux/commands/command"
require "rmux/commands/global_options"
require "rmux/commands/window_options"
require "rmux/commands/server_options"
require "rmux/parsers/options_parser"

module Rmux
  class Error < StandardError; end
  extend self

  def execute(command, *args)
    command.new(*args).execute
  end

  def global_options
    Rmux::Commands::GlobalOptions.new.execute!
  end

  def server_options
    Rmux::Commands::ServerOptions.new.execute!
  end

  def window_options
    Rmux::Commands::WindowOptions.new.execute!
  end
end
