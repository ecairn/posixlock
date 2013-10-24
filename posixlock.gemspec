# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'posixlock/version'

Gem::Specification.new do |gem|
  gem.name          = "posixlock"
  gem.version       = Posixlock::VERSION
  gem.authors       = ["Denis Jean"]
  gem.email         = ["denis.jean@ecairn.com"]
  gem.description   = %q{}
  gem.summary       = %q{}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.extensions    = %w[ext/posixlock/extconf.rb]

  # tests
  gem.add_development_dependency 'rake-compiler', '~> 0.8.1'
  gem.add_development_dependency 'rake', '~> 0.9.3'
end
