# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dronestream/version'

Gem::Specification.new do |spec|
  spec.name          = "dronestream"
  spec.version       = Dronestream::VERSION
  spec.authors       = ["thenickcox"]
  spec.email         = ["nick@nickcox.me"]
  spec.description   = %q{A Ruby wrapper for the dronestream API}
  spec.summary       = %q{A Ruby wrapper for the dronestream API}
  spec.homepage      = "https://github.com/thenickcox/dronestream"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency 'httparty'
 
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'rspec'
end
