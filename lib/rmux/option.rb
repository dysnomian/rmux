module Rmux
  class Option
    attr_reader   :name, :scope
    attr_accessor :value

    def initialize(name, value, scope)
      @name  = name
      @value = value
      @scope = scope
    end

    def ==(o)
      name == o.name && value == o.value
    end

    def set!
      `#{shell_set_command}`
    end

    # TODO: #toggle
    def global?
      scope == :global
    end

    def server?
      scope == :server
    end

    def window?
      scope == :window
    end

    #FIXME: Should use tmuxified names and values
    def shell_set_command
      case
      when scope == :global
        "set -g #{name} #{value}"
      else
        raise NotImplementedError
      end
    end

    # TODO: reload state from tmux, throw error if it's not what you set
  end
end
