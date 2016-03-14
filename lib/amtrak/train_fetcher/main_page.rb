require 'date'

module Amtrak
  class TrainFetcher
    # Service for getting train time results/cookies from the Amtrak website
    class MainPage
      attr_reader :agent, :from, :to

      def initialize(agent, from, to, date: nil)
        @agent = agent
        @from = from
        @to = to
        @date = date
      end

      def request
        retries ||= 3
        _request
      rescue Mechanize::ResponseCodeError
        retries -= 1
        raise if retries.zero?

        retry
      end

      def _request
        @request ||= agent.post(
          'https://tickets.amtrak.com/itd/amtrak',
          request_body,
          headers
        )
      end

      def headers
        { 'Content-Type' => 'application/x-www-form-urlencoded' }
      end

      # rubocop:disable all
      def request_body
        {
          "_handler=amtrak.presentation.handler.request.rail.AmtrakRailTrainStatusSearchRequestHandler/_xpath=/sessionWorkflow/productWorkflow[@product='Rail']" => "",
          "/sessionWorkflow/productWorkflow[@product='Rail']/tripRequirements/journeyRequirements[1]/departDate.usdate" => departure_date,
          "/sessionWorkflow/productWorkflow[@product='Rail']/tripRequirements/@trainStatusType" => "statusByCityPair",
          "/sessionWorkflow/productWorkflow[@product='Rail']/tripRequirements/journeyRequirements[1]/departDate/@radioSelect" => "arrivalTime",
          "requestor"        => "amtrak.presentation.handler.page.rail.AmtrakRailGetTrainStatusPageHandler",
          "xwdf_origin"      => "/sessionWorkflow/productWorkflow[@product='Rail']/travelSelection/journeySelection[1]/departLocation/search",
          "wdf_origin"       => from.to_s,
          "xwdf_destination" => "/sessionWorkflow/productWorkflow[@product='Rail']/travelSelection/journeySelection[1]/arriveLocation/search",
          "wdf_destination"  => to.to_s,
        }
      end
      # rubocop:enable all

      def departure_date
        date.strftime('%0m/%d/%Y')
      end

      def date
        @date ||= Date.today
      end

      def body
        request.body
      end

      def total_pages
        (Float(extract_listing_length) / 10).ceil
      end

      def extract_listing_length
        if matches = body.match(/var availabilityLength = '(\d+)';/)
          matches[1]
        else
          0
        end
      end

      def release
        body.match(/"Amtrak Release ([^"]+)"/)[1]
      end
    end
  end
end
