require 'bundler/gem_tasks'
require 'rake/testtask'
require 'dronestream/version'

require 'rspec/core/rake_task'
 
desc 'Default: run specs.'
task :default => :spec

desc 'Run specs'
RSpec::Core::RakeTask.new do |test|
  test.pattern = 'spec/lib/dronestream/*_spec.rb'
end

namespace :gem do
  task :publish do
    puts "Building gem..."
    sh "gem build dronestream.gemspec"
    puts "Pushing to rubygems.org..."
    sh "gem push dronestream-#{Dronestream::VERSION}.gem"
  end
end
