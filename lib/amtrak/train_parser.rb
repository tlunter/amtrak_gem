module Amtrak
  # Will take in an JSON document as a hash and parse out the train schedule
  class TrainParser
    # Error raised when the parser runs into an issue
    class Error < Amtrak::Error; end

    def self.parse(json)
      new(json).parse
    end

    attr_reader :json

    def initialize(json)
      @json = json
    end

    def parse
      (json['journeys'] || [])
        .map(&method(:parse_journey))
        .compact
    end

    def parse_journey(journey)
      segment = journey['segments'].first
      return unless segment

      {
        number: segment['trainNumber'].to_i,
        departure: find_departure_times(segment),
        arrival: find_arrival_times(segment)
      }
    end

    def find_departure_times(segment)
      date, scheduled_time = segment['originScheduledDepartureDateTime'].split('T')
      estimated_depart = segment['originEstimatedDepartureDateTime']
      _, estimated_time = estimated_depart.split('T') if estimated_depart

      {
        date: date,
        scheduled_time: format_time(scheduled_time),
        estimated_time: format_time(estimated_time)
      }
    end

    def find_arrival_times(segment)
      date, scheduled_time = segment['destinationScheduledArrivalDateTime'].split('T')
      estimated_arrival = segment['destinationEstimatedArrivalDateTime']
      _, estimated_time = estimated_arrival.split('T') if estimated_arrival

      {
        date: date,
        scheduled_time: format_time(scheduled_time),
        estimated_time: format_time(estimated_time)
      }
    end

    private

    def format_time(time)
      return unless time

      Time.parse(time).strftime('%l:%M %P')
    end
  end
end
