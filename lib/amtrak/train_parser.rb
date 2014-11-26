require 'nokogiri'

module Amtrak
  # Will take in an HTML document as a string and parse out the train schedule
  class TrainParser
    def self.parse(text)
      new(text).parse
    end

    attr_reader :document

    def initialize(document)
      @document = Nokogiri::HTML.parse(document)
    end

    def parse
      trains = []

      until train_nodes.empty?
        departure, arrival = train_nodes.shift(2)
        trains << {
          number: parse_train_number(departure),
          departure: parse_train(departure),
          arrival: parse_train(arrival)
        }
      end

      trains
    end

    def train_nodes
      @train_nodes ||= document.search(
        "//tr[contains(@class, 'status_result')]"
      ).tap { |results| fail 'No trains found' unless results.count > 0 }.to_a
    end

    def parse_train_number(node)
      find!(
        node, ".//th[@class='service']/div[@class='route_num']/text()"
      ).to_s.to_i
    end

    def parse_train(node) # rubocop:disable Metrics/MethodLength
      scheduled_date = find!(
        node, ".//td[@class='scheduled']/div[@class='date']/text()"
      ).to_s
      estimated_date = find!(
        node, ".//td[@class='act_est']/div[@class='date']/text()"
      ).to_s
      scheduled_time = remove_parentheses(
        find!(node, ".//td[@class='scheduled']/div[@class='time']/text()").to_s
      )
      estimated_time = remove_parentheses(
        find!(node, ".//td[@class='act_est']/div[@class='time']/text()").to_s
      )

      {
        scheduled_date: scheduled_date,
        estimated_date: estimated_date,
        scheduled_time: scheduled_time,
        estimated_time: estimated_time
      }
    end

    def find!(node, xpath)
      node.search(xpath).tap { |rs| fail "#{rs.count} results" if rs.count > 1 }
    end

    def make_datetime(date, time)
      if date.nil? || time.nil?
        return
      else
        DateTime.parse("#{date} at #{time}")
      end
    end

    def remove_parentheses(time_string)
      if matches = /\(([^)]+)\)/.match(time_string)
        matches[1]
      else
        time_string
      end
    end
  end
end
