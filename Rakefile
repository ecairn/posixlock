require "bundler/gem_tasks"
require 'rake/extensiontask'
require 'rake/testtask'

gemspec = Gem::Specification.load('posixlock.gemspec')
Rake::ExtensionTask.new do |ext|
  ext.name = 'posixlock'
  ext.ext_dir = 'ext/posixlock'
  ext.lib_dir = 'lib/posixlock'
  ext.gem_spec = gemspec
end

Rake::TestTask.new do |t|
  t.pattern = "test/test_*.rb"
  t.verbose = true
end

task :default => [:compile, :test]
