require 'excon'
require 'date'

module Amtrak
  class TrainFetcher
    # Service for getting train time results/cookies from the Amtrak website
    class MainPage
      attr_reader :from, :to

      def initialize(from, to, date: nil)
        @from = from
        @to = to
        @date = date
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
          'https://tickets.amtrak.com/itd/amtrak',
          headers: headers,
          body: URI.encode_www_form(body),
          expects: [200]
        )
      rescue Excon::Errors::ClientError, Excon::Errors::ServerError => ex
        raise Amtrak::TrainFetcher::Error, "#{ex.class} #{ex.message}"
      end

      def headers
        { 'Content-Type' => 'application/x-www-form-urlencoded' }
      end

      # rubocop:disable all
      def body
        {
          "_handler=amtrak.presentation.handler.request.rail.AmtrakRailTrainStatusSearchRequestHandler/_xpath=/sessionWorkflow/productWorkflow[@product='Rail']" => 'SEARCH',
          "/sessionWorkflow/productWorkflow[@product='Rail']/tripRequirements/journeyRequirements[1]/departDate.usdate" => departure_date,
          "/sessionWorkflow/productWorkflow[@product='Rail']/tripRequirements/@trainStatusType" => 'statusByCityPair',
          "/sessionWorkflow/productWorkflow[@product='Rail']/tripRequirements/journeyRequirements[1]/departDate/@radioSelect" => 'arrivalTime',
          'requestor'        => 'amtrak.presentation.handler.page.AmtrakCMSNavigationTabPageHandler',
          'xwdf_origin'      => "/sessionWorkflow/productWorkflow[@product='Rail']/travelSelection/journeySelection[1]/departLocation/search",
          'wdf_origin'       => from.to_s,
          'xwdf_destination' => "/sessionWorkflow/productWorkflow[@product='Rail']/travelSelection/journeySelection[1]/arriveLocation/search",
          'wdf_destination'  => to.to_s,
        }
      end
      # rubocop:enable all

      def departure_date
        date.strftime('%0m/%d/%Y')
      end

      def date
        @date ||= Date.today
      end

      def session_id
        request.headers['Set-Cookie'].match(/JSESSIONID=([^;]*)/)[1]
      end

      def total_pages
        (Float(extract_listing_length) / 10).ceil
      end

      def extract_listing_length
        if matches = request.body.match(/var availabilityLength = '(\d+)';/)
          matches[1]
        else
          0
        end
      end

      def release
        request.body.match(/"Amtrak Release ([^"]+)"/)[1]
      end
    end
  end
end
