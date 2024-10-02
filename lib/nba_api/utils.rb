require 'active_support/core_ext/string/inflections'
require 'httparty'
require 'json'
require 'zlib'
require 'stringio'

module NbaApi
  module Utils
    BASE_URL = 'https://stats.nba.com/stats'
    MAX_RETRIES = 10
    INITIAL_TIMEOUT = 1.5
    TIMEOUT_INCREMENT = 0.5

    class << self
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

      def make_request(endpoint, params = {}, retries = 0, timeout = INITIAL_TIMEOUT)
        url = "#{BASE_URL}/#{endpoint}"
        response = HTTParty.get(url, query: params, headers: default_headers)
        body = decompress_response(response)
        parsed_json = JSON.parse(body)
        transformed_json = transform_keys(parsed_json)

        if transformed_json[:meta].present?
          transformed_json
        else
          if retries < MAX_RETRIES
            puts "Invalid response, retrying in #{timeout} seconds... (Attempt #{retries + 1}/#{MAX_RETRIES})"
            sleep(timeout)
            make_request(endpoint, params, retries + 1, timeout + TIMEOUT_INCREMENT)
          else
            { error: "Failed to get valid response after #{MAX_RETRIES} attempts" }
          end
        end
      rescue => e
        puts "Error: #{e.message}"
        puts e.backtrace
        if retries < MAX_RETRIES
          puts "Error occurred, retrying in #{timeout} seconds... (Attempt #{retries + 1}/#{MAX_RETRIES})"
          sleep(timeout)
          make_request(endpoint, params, retries + 1, timeout + TIMEOUT_INCREMENT)
        else
          { error: "Failed to get response after #{MAX_RETRIES} attempts: #{e.message}" }
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
    end
  end
end