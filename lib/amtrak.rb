require 'logger'

# Main Amtrak module
module Amtrak
  class Error < StandardError; end

  def self.logger
    @logger ||= Logger.new(STDOUT)
  end

  def self.get(from, to, date: nil)
    Amtrak::TrainFetcher.get(from, to, date: date).map do |html|
      Amtrak::TrainParser.parse(html)
    end.flatten
  end
end

require 'amtrak/train_parser'
require 'amtrak/train_fetcher'
require 'amtrak/version'
