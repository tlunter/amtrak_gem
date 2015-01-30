require 'simplecov'
require 'pry'
require 'rspec'

SimpleCov.start do
  add_filter '/spec/'
end

require 'amtrak'
require 'json'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.color = true
  config.mock_with :rspec
  config.formatter = :documentation
  config.tty = true
end
