# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'netzke/version'

Gem::Specification.new do |spec|
  spec.name          = "netzke"
  spec.version       = Netzke::VERSION
  spec.authors       = ["Max Gorin"]
  spec.email         = ["gorinme@gmail.com"]
  spec.summary       = "Client-server GUI components with Sencha Ext JS and Ruby on Rails"
  spec.description   = "Build complex web GUI in a modular way"
  spec.homepage      = "http://netzke.org"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_dependency 'netzke-core'
  spec.add_dependency 'netzke-basepack'
  spec.add_dependency 'netzke-testing'
end
