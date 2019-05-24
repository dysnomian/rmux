lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rmux/version"

Gem::Specification.new do |spec|
  spec.name          = "rmux"
  spec.version       = Rmux::VERSION
  spec.authors       = ["Liss McCabe"]
  spec.email         = ["liss+rmux@cuteasheck.com"]

  spec.summary       = %q{A Ruby interface for controlling Tmux.}
  spec.homepage      = "https://github.com/dysnomian/rmux"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",    "~> 2.0"
  spec.add_development_dependency "rake",       "~> 12.3"
  spec.add_development_dependency "rspec",      "~> 3.8"
  spec.add_development_dependency "pry",        "~> 0.12"
  spec.add_development_dependency "standardrb", "~> 1.0"
end
