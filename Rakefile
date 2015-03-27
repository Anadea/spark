require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:rspec)
RSpec::Core::RakeTask.new(:smoke) do |t|
  t.rspec_opts = "--tag smoke"
end

desc 'Run the test suite'
task :default => :rspec
