require 'mechanize'

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
      @date = date
    end

    def check_release
      first_page.release == '6.25.02a'
    end

    def get
      requests = [first_page.body]

      (2..total_pages).each do |page|
        requests << Amtrak::TrainFetcher::TrainPage.get(agent, page)
      end

      requests
    end

    def first_page
      @first_page ||= Amtrak::TrainFetcher::MainPage.new(agent, from, to, date: date)
    end

    def total_pages
      return @total_pages if @total_pages

      total_pages = first_page.total_pages
      Amtrak.logger.debug "Total pages: #{total_pages}"

      @total_pages = total_pages
    end

    def agent
      @agent ||= Mechanize.new.tap do |m|
        m.user_agent_alias = 'Mac Safari'
        m.log = Amtrak.logger
      end
    end
  end
end

require 'amtrak/train_fetcher/main_page'
require 'amtrak/train_fetcher/train_page'
