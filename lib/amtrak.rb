# Main Amtrak module
module Amtrak
  class Error < StandardError; end

  def self.get(from, to, date: nil)
    Amtrak::TrainParser.parse(
      Amtrak::TrainService.get(from, to, date: date)
    )
  end
end

require 'amtrak/train_parser'
require 'amtrak/train_service'
require 'amtrak/version'
