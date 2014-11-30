require 'excon'

module Amtrak
  class TrainFetcher
    class TrainPage
      def self.get(*args)
        new(*args).get
      end

      attr_reader :session_id, :page

      def initialize(session_id, page)
        @session_id = session_id
        @page = page
      end

      def get
        request.body
      end

      def request
        @request ||= Excon.get(
          'https://tickets.amtrak.com/itd/amtrak/TrainStatusRequest',
          headers: headers,
          query: query
        )
      rescue Excon::Errors::ClientError, Excon::Errors::ServerError => ex
        raise Amtrak::TrainFetcher::Error, "#{ex.class} #{ex.message}"
      end

      def headers
        { 'Cookie' => "JSESSIONID=#{session_id}" }
      end

      def query
        { '_trainstatuspage' => page }
      end
    end
  end
end
