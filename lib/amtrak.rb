require 'logger'

# Main Amtrak module
module Amtrak
  class Error < StandardError; end

  def self.logger
    @logger ||= Logger.new(STDOUT)
  end

  def self.get(from, to, date: nil)
    json = Amtrak::TrainFetcher.get(from, to, date: date)
    Amtrak::TrainParser.parse(json)
  end
end

require 'amtrak/train_parser'
require 'amtrak/train_fetcher'
require 'amtrak/version'
