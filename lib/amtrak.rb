require 'excon'
require 'json'

require 'amtrak/version'

# Main Amtrak class
class Amtrak
  class Error < StandardError; end

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

  def request
    retries ||= 3
    _request
  rescue Excon::Errors::SocketError, Excon::Errors::Timeout
    retries -= 1
    retry unless retries.zero?
  end

  def body
    boilerplate_body.merge(
      'dateTime' => date_time,
      'origin' => from.upcase,
      'destination' => to.upcase,
    )
  end

  private

  def transform(raw_body)
    journeys = JSON.parse(raw_body)['journeys']
    return [] if journeys.nil?

    journeys
      .map { |j| j['segments'].first }
      .reject(&:nil?)
      .map(&method(:transform_segment))
  end

  def transform_segment(segment)
    {
      number: segment['trainNumber'].to_i,
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

  def _request
    @request ||= Excon.post(
      'https://tickets.amtrak.com/Rider/jaxrs/TrainStatus',
      headers: { 'Content-Type' => 'application/json' },
      body: body.to_json,
      expects: [200, 302],
    )
  rescue Excon::Errors::ClientError, Excon::Errors::ServerError => ex
    raise Amtrak::TrainFetcher::Error, "#{ex.class} #{ex.message}"
  end

  def boilerplate_body
    {
      'appType' => 'IBL',
      'versionNumber' => '2.5.0',
      'type' => 'D',
    }
  end

  def date_time
    date.strftime('%Y-%m-%dT00:00:00')
  end

  def build_time_hash(scheduled_raw, estimated_raw, posted_raw)
    {
      date: format_date(scheduled_raw),
      scheduled_time: format_time(scheduled_raw),
      estimated_time: format_time(estimated_raw),
      posted_time: format_time(posted_raw),
    }.reject { |k, v| v.nil? }
  end

  def format_date(date_str)
    return if date_str.nil?

    Time.parse(date_str).strftime('%a, %b %e %Y')
  end

  def format_time(time_str)
    return if time_str.nil?

    Time.parse(time_str).strftime('%-I:%M %P')
  end
end
