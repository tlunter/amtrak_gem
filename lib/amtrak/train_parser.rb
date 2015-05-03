require 'nokogiri'

module Amtrak
  # Will take in an HTML document as a string and parse out the train schedule
  class TrainParser
    # Error raised when the parser runs into an issue
    class Error < Amtrak::Error; end

    def self.parse(text)
      new(text).parse
    end

    attr_reader :document

    def initialize(document)
      @document = Nokogiri::HTML.parse(document)
    end

    def parse
      trains = []

      while train_node = train_nodes.shift
        cancelled = cancelled?(train_node)
        trains << {
          number: parse_train_number(train_node),
          departure: parse_train(find_depart_status(train_node), cancelled),
          arrival: parse_train(find_arrive_status(train_node), cancelled)
        }
      end

      trains
    rescue Nokogiri::SyntaxError => ex
      raise Amtrak::TrainParser::Error, "#{ex.class} #{ex.message}"
    end

    def train_nodes
      @train_nodes ||= document.search(
        "//div[@id='train_status_resp_by_citypair']"
      ).tap { |results| fail 'No trains found' unless results.count > 0 }.to_a
    end

    def cancelled?(node)
      node.search(".//div[@class='cancelledMsg']").count > 0
    end

    def find_depart_status(node)
      find!(node, ".//div[@id='resp_by_citypair_depart_status_details']")
    end

    def find_arrive_status(node)
      find!(node, ".//div[@id='resp_by_citypair_arrive_status_details']")
    end

    def parse_train_number(node)
      number = parse_train_number_25(node)
      return number unless number.zero?

      parse_train_number_22(node)
    end

    def parse_train_number_25(node)
      find!(
        node,
        ".//div[@id='resp_by_citypair_subheading']/\
        div[@id='resp_by_citypair_subheading_trainname']/div/text()"
      ).to_s.to_i
    end

    def parse_train_number_22(node)
      node.search(
        ".//div[@id='resp_by_citypair_subheading']/\
        div[@id='resp_by_citypair_subheading_trainname']/text()"
      ).first.to_s.to_i
    end

    def parse_train(node, cancelled) # rubocop:disable Metrics/MethodLength
      date = find!(
        node, ".//div[@class='arriveDepartDate']/text()"
      ).to_s
      if cancelled
        estimated_time = scheduled_time = 'Cancelled'
      else
        scheduled_time = clean_msg(
          find!(node, ".//div[@class='scheduledArriveDepartMsg']/text()").to_s
        )
        estimated_time = find(
          node, ".//div[@class='arriveDepartTime']/text()"
        ).to_s
      end

      {
        date: date,
        scheduled_time: scheduled_time,
        estimated_time: estimated_time
      }
    end

    def find!(node, xpath)
      node.search(xpath).tap { |rs| fail "#{rs.count} results" if rs.count > 1 }
    end

    def find(node, xpath)
      find!(node, xpath)
    rescue RuntimeError
      nil
    end

    def clean_msg(time_msg)
      return unless matches = /\d+:\d+ (a|p)m/.match(time_msg)

      matches[0]
    end
  end
end
