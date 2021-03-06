# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wunderground/version'

Gem::Specification.new do |spec|
  spec.name          = "wunderground"
  spec.version       = Wunderground::VERSION
  spec.authors       = ["Richard Davis"]
  spec.email         = ["rdavis.bacs@gmail.com"]
  spec.description   = %q{Weather Underground API Wrapper}
  spec.summary       = %q{A ruby gem to easily access the Weather Underground data}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'  
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'pry'
end
