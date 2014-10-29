# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mapquest_api/version'

Gem::Specification.new do |spec|
  spec.name          = "mapquest_api"
  spec.version       = MapquestApi::VERSION
  spec.authors       = ["johnlinvc"]
  spec.email         = ["johnlinvc@gmail.com"]
  spec.summary       = %q{mapquest api wrapper}
  spec.description   = %q{mapquest api wrapper}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
