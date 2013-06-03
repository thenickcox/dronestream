require 'bundler/gem_tasks'
require 'rake/testtask'

require 'rspec/core/rake_task'
 
desc 'Default: run specs.'
task :default => :test

desc 'Run specs'
RSpec::Core::RakeTask.new do |test|
  test.pattern = 'spec/lib/dronestream/*_spec.rb'
end
