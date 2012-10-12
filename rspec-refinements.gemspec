# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec-refinements/version'

Gem::Specification.new do |gem|
  gem.name          = "rspec-refinements"
  gem.version       = Rspec::Refinements::VERSION
  gem.authors       = ["Akira Matsuda"]
  gem.email         = ["ronnie@dio.jp"]
  gem.description   = 'keep your BasicObject clean using refinements'
  gem.summary       = 'RSpec + Ruby 2.0 refinements'
  gem.homepage      = 'https://github.com/amatsuda/rspec-refinements'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rspec', ['>= 0']
end
