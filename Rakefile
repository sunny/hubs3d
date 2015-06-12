# Bundler
require "bundler/gem_tasks"

# Specs
begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

task default: :spec
