# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'game_of_life/version'

Gem::Specification.new do |gem|
  gem.name          = "game_of_life"
  gem.version       = GameOfLife::VERSION
  gem.authors       = ["Zac Stewart"]
  gem.email         = ["zgstewart@gmail.com"]
  gem.description   = %q{Game of Life}
  gem.summary       = %q{Game of Life}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
end
