# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'groupme/version'

Gem::Specification.new do |gem|
  gem.name          = "groupme"
  gem.version       = GroupMe::VERSION
  gem.authors       = ["David Radcliffe"]
  gem.email         = ["radcliffe.david@gmail.com"]
  gem.description   = %q{Simple wrapper for the GroupMe v3 API}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/dwradcliffe/groupme"
  gem.licenses      = ['MIT']

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'redcarpet', '~> 2.0'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'json', '~> 1.7'

  gem.add_dependency 'faraday'
  gem.add_dependency 'faraday_middleware'
  gem.add_dependency 'hashie', '~> 2.0'
  gem.add_dependency 'multi_json', '~> 1.3'
  gem.add_dependency 'simple_oauth', '~> 0.2'
end
