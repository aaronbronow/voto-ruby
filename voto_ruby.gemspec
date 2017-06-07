# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'voto_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "voto_ruby"
  spec.version       = VotoMobile::VERSION
  spec.authors       = ["BlueSquare.org"]
  spec.email         = ["opensource@bluesquare.org"]
  spec.summary       = %q{A Ruby gem for communicating with the VOTO Mobile API}
  spec.description   = %q{Query the VOTO Mobile REST API to send SMS messages}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'listen', '3.0.8'
  spec.add_development_dependency 'public_suffix', '1.4.6'
  spec.add_development_dependency 'tins', '1.6.0'
  spec.add_development_dependency 'term-ansicolor', '1.3.2'
  spec.add_development_dependency 'webmock', '2.3.2'

  spec.add_dependency('builder', '>= 2.1.2')
  spec.add_dependency('multi_json')

  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-remote'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-nc'
end
