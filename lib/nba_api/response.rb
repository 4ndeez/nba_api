# frozen_string_literal: true

require "json"
require "zlib"
require "stringio"
require "nba_api/request"

module NbaApi
  module Response
    extend self

    MAX_RETRIES = 4
    TIMEOUT_INCREMENT = 2

    def transform(response)
      body = decompress_response(response)
      parsed_json = JSON.parse(body)
      transform_keys(parsed_json)
    end

    def handle_error(endpoint, params, retries, timeout_time)
      if retries < MAX_RETRIES
        puts "Invalid response, retrying in #{timeout_time} seconds... (Attempt #{retries + 1}/#{MAX_RETRIES})"

        sleep(timeout_time)
        Request.get(endpoint, params, retries + 1, timeout_time + TIMEOUT_INCREMENT)
      else
        { error: "Failed to get valid response after #{MAX_RETRIES} attempts" }
      end
    end

    private

    def transform_keys(response)
      case response
      when Array
        response.map { |e| transform_keys(e) }
      when Hash
        response.each_with_object({}) do |(k, v), result|
          new_key = k.to_s.underscore.to_sym
          result[new_key] = transform_keys(v)
        end
      else
        response
      end
    end

    def decompress_response(response)
      case response.headers["content-encoding"]
      when "gzip"
        Zlib::GzipReader.new(StringIO.new(response.body)).read
      when "deflate"
        Zlib::Inflate.inflate(response.body)
      else
        response.body
      end
    end
  end
end
