module Amtrak
  class TrainFetcher
    # Service for getting per page train time HTML from the Amtrak website
    class TrainPage
      def self.get(*args)
        new(*args).get
      end

      attr_reader :agent, :page

      def initialize(agent, page)
        @agent = agent
        @page = page
      end

      def get
        request.body
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
        @request ||= agent.get(
          "https://tickets.amtrak.com/itd/amtrak/TrainStatusRequest?&_trainstatuspage=#{page}",
          [],
          nil,
          headers
        )
      end

      def headers
        {
          'ADRUM' => 'isAjax:true',
          'X-Prototype-Version' => '1.6.0.3',
          'X-Requested-With' => 'XMLHttpRequest'
        }
      end

      def query
        { '_trainstatuspage' => page }
      end
    end
  end
end
