require 'date'
require 'json'
require 'excon'

module Amtrak
  # Service for getting train time HTML page from the Amtrak website
  class TrainFetcher
    def self.get(*args)
      new(*args).get
    end

    attr_reader :from, :to, :date

    def initialize(from, to, date: nil)
      @from = from
      @to = to
      @date = date || Date.today
    end

    def check_release
      first_page.release == '6.25.02a'
    end

    def get
      JSON.parse(response.body)
    end

    private

    def response
      Excon.post(
        'https://rider.amtrak.com/MobileApps/TrainStatus',
        body: body.to_json,
        headers: headers
      )
    end

    def body
      {
        'dateTime' => date.strftime('%Y-%0m-%d'),
        'origin' => from.upcase,
        'destination' => to.upcase,
        'type' => 'A',
        'versionNumber' => '2.2.12'
      }
    end

    def headers
      {
        'Accept' => '*/*',
        'Content-Type' => 'application/json'
      }
    end
  end
end
