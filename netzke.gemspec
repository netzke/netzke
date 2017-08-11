lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'netzke/version'
version = Netzke::VERSION

Gem::Specification.new do |spec|
  spec.name          = "netzke"
  spec.version       = version
  spec.authors       = ["Max Gorin"]
  spec.email         = ["max@goodbitlabs.com"]
  spec.summary       = "Client-server GUI components with Sencha Ext JS and Ruby on Rails"
  spec.description   = "Netzke helps you build complex web UI in a modular way"
  spec.homepage      = "http://netzke.org"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "netzke-core", "6.5.0.0.rc1"
  spec.add_dependency "netzke-basepack", "6.5.0.0.rc1"
  spec.add_dependency "netzke-testing", "6.5.0.0.rc1"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
