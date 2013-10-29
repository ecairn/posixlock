# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'posixlock/version'

Gem::Specification.new do |gem|
  gem.name          = "posixlock"
  gem.version       = Posixlock::VERSION
  gem.authors       = ["Ara T. Howard", "Denis Jean"]
  gem.email         = ["ara.t.howard@noaa.gov", "denis.jean@ecairn.com"]
  gem.description   = "File#posixlock gives access to read/write locks with an interface identical to File#flock, and File#lockf gives access to a lockf implementation similar to the one posix specifies with added functionality for read locks. The biggest difference between the two methods is that lockf will throw errors for errno's like EAGAIN, EACCESS, etc."
  gem.summary       = "methods to add posix (fcntl based and nfs safe) locking to the builtin File class"
  gem.homepage      = "http://www.codeforpeople.com/lib/ruby/posixlock/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.extensions    = %w[ext/posixlock/extconf.rb]
  gem.required_ruby_version = '~> 1.9.2'

  # tests
  gem.add_development_dependency 'rake-compiler', '~> 0.8.1'
  gem.add_development_dependency 'rake', '~> 0.9.3'
end
