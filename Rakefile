require "bundler/gem_tasks"
require 'irb'

task :default => :spec

task :spec do
  begin
      require 'rspec/core/rake_task'
        RSpec::Core::RakeTask.new(:spec)
  rescue LoadError
  end
end

task :cli do
  ARGV.clear
  IRB.start
end
