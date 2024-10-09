require 'active_support/core_ext/string/inflections'
require 'httparty'
require 'json'
require 'zlib'
require 'stringio'
require 'date'

module NbaApi
  module Utils
    BASE_URL = 'https://stats.nba.com/stats'
    MAX_RETRIES = 10
    INITIAL_TIMEOUT = 1.5
    TIMEOUT_INCREMENT = 0.5

    class << self
      def make_request(endpoint, params = {}, retries = 0, timeout = INITIAL_TIMEOUT)
        url = "#{BASE_URL}/#{endpoint}"
        response = HTTParty.get(url, query: params, headers: default_headers)

        if response.code == 200
          transform_response(response)
        else
          if retries < MAX_RETRIES
            puts "Invalid response, retrying in #{timeout} seconds... (Attempt #{retries + 1}/#{MAX_RETRIES})"
            puts "Response: #{decompress_response(response)}"
            sleep(timeout)
            make_request(endpoint, params, retries + 1, timeout + TIMEOUT_INCREMENT)
          else
            { error: "Failed to get valid response after #{MAX_RETRIES} attempts" }
          end
        end
      rescue => e
        puts "Error: #{e.message}"
        puts e.backtrace # remove before prod
        if retries < MAX_RETRIES
          puts "Error occurred, retrying in #{timeout} seconds... (Attempt #{retries + 1}/#{MAX_RETRIES})"
          sleep(timeout)
          make_request(endpoint, params, retries + 1, timeout + TIMEOUT_INCREMENT)
        else
          { error: "Failed to get response after #{MAX_RETRIES} attempts: #{e.message}" }
        end
      end

      def default_headers
        {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip, deflate, br',
          'Accept-Language' => 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7',
          'Connection' => 'keep-alive',
          'DNT' => '1',
          'Host' => 'stats.nba.com',
          'Origin' => 'https://www.nba.com',
          'Referer' => 'https://www.nba.com/',
          'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        }
      end

      def transform_keys(object)
        case object
        when Array
          object.map { |e| transform_keys(e) }
        when Hash
          object.each_with_object({}) do |(k, v), result|
            new_key = k.to_s.underscore.to_sym
            result[new_key] = transform_keys(v)
          end
        else
          object
        end
      end

      def decompress_response(response)
        case response.headers['content-encoding']
        when 'gzip'
          Zlib::GzipReader.new(StringIO.new(response.body)).read
        when 'deflate'
          Zlib::Inflate.inflate(response.body)
        else
          response.body
        end
      end

      def transform_response(response)
        body = decompress_response(response)
        parsed_json = JSON.parse(body)
        transform_keys(parsed_json)
      end

      def format_date(date)
        case date
        when String
          Date.parse(date).strftime('%m/%d/%Y')
        when Date
          date.strftime('%m/%d/%Y')
        when Time, DateTime
          date.to_date.strftime('%m/%d/%Y')
        else
          raise ArgumentError, "Invalid date format: #{date}"
        end
      end

      def team_to_team_id(team)
        find_team_by_abbreviation(team) || find_team_by_name(team)
      end

      def find_team_by_abbreviation(abbreviation)
        Constants::TEAMS.find { |team| team[:abbreviation] == abbreviation.upcase }&[:id]
      end

      def find_team_by_name(name)
        Constants::TEAMS.find { |team| team[:name] == name }&[:id]
      end
    end
  end
end