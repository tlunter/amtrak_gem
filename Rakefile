require 'rake'

default_tasks = []

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.patterns = ['lib/**/*.rb','spec/**/*.rb']
  end

  default_tasks << :rubocop
rescue LoadError
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)

  default_tasks << :spec
rescue LoadError
end

task default: default_tasks
