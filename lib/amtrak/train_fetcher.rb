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

    def get
      (1..total_pages).map do |page|
        Amtrak::TrainFetcher::TrainPage.get(session_id, page)
      end
    end

    def first_page
      @first_page ||= Amtrak::TrainFetcher::MainPage.new(from, to, date: date)
    end

    def session_id
      @session_id ||= first_page.session_id
    end

    def total_pages
      @total_pages ||= first_page.total_pages
    end
  end
end

require 'amtrak/train_fetcher/main_page'
require 'amtrak/train_fetcher/train_page'
