require 'excon'
require 'json'

module Amtrak
  # Service for getting train time HTML page from the Amtrak website
  class TrainFetcher
    class Error < Amtrak::Error; end

    def self.get(*args)
      new(*args).get
    end

    attr_reader :from, :to, :date

    def initialize(from, to, date: nil)
      @from = from
      @to = to
      @date = date || Date.today
    end

    def get
      transform(request.body)
    end

    def transform(raw_body)
      if journeys = JSON.parse(raw_body)['journeys']
        journeys.map do |journey|
          if segment = journey['segments'].first
            {
              number: segment['trainNumber'],
              departure: build_time_hash(
                segment['originScheduledDepartureDateTime'],
                segment['originEstimatedDepartureDateTime'],
                segment['originPostedDepartureDateTime'],
              ),
              arrival: build_time_hash(
                segment['destinationScheduledArrivalDateTime'],
                segment['destinationEstimatedArrivalDateTime'],
                segment['destinationPostedArrivalDateTime'],
              ),
            }
          end
        end.compact
      end
    end

    def request
      retries ||= 3
      _request
    rescue Excon::Errors::SocketError, Excon::Errors::Timeout
      retries -= 1
      retry unless retries.zero?
    end

    def _request
      @request ||= Excon.post(
        'https://tickets.amtrak.com/Rider/jaxrs/TrainStatus',
        headers: headers,
        body: body.to_json,
        expects: [200, 302]
      )
    rescue Excon::Errors::ClientError, Excon::Errors::ServerError => ex
      raise Amtrak::TrainFetcher::Error, "#{ex.class} #{ex.message}"
    end

    def headers
      {
        'Content-Type' => 'application/json',
      }
    end

    def boilerplate_body
      {
        "appType" => "IBL",
        "versionNumber" => "2.5.0",
        "type" => "D",
      }
    end

    def date_time
      date.strftime('%Y-%m-%dT00:00:00')
    end

    def body
      boilerplate_body.merge(
        "dateTime" => date_time,
        "origin" => from,
        "destination" => to,
      )
    end

    def build_time_hash(scheduled_raw, estimated_raw, posted_raw)
      scheduled = Time.parse(scheduled_raw) if scheduled_raw
      estimated = Time.parse(estimated_raw) if estimated_raw
      posted = Time.parse(posted_raw) if posted_raw
      {
        date: scheduled ? scheduled.strftime('%a, %b %e %Y') : nil,
        scheduled_time: scheduled ? scheduled.strftime('%I:%M %P') : nil,
        estimated_time: estimated ? estimated.strftime('%I:%M %P') : nil,
        posted_time: posted ? posted.strftime('%I:%M %P') : nil,
      }
    end
  end
end
