# frozen_string_literal: true

require "httparty"
require "nba_api/response"

module NbaApi
  module Request
    extend self

    SUCCESS_CODE = 200
    BASE_URL = "https://stats.nba.com/stats"

    def get(endpoint, params = {}, retries = 0, timeout_time = 3)
      request_url = url(endpoint)
      timeout_guard
      response = HTTParty.get(request_url, query: params, headers: default_headers)

      if response.code == SUCCESS_CODE
        Response.transform(response)
      else
        Response.handle_error(endpoint, params, retries, timeout_time)
      end
    end

    def get_static(endpoint, params = {})
      HTTParty.get(endpoint, query: params)
    end

    private

    def timeout_guard(timeout_time = 1.5)
      sleep(rand(1..timeout_time))
    end

    def url(endpoint)
      "#{BASE_URL}/#{endpoint}"
    end

    def default_headers
      {
        "Accept" => "*/*",
        "Accept-Encoding" => "gzip, deflate, br",
        "Accept-Language" => "ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7",
        "Connection" => "keep-alive",
        "DNT" => "1",
        "Host" => "stats.nba.com",
        "Origin" => "https://www.nba.com",
        "Referer" => "https://www.nba.com/",
        "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36"
      }
    end
  end
end
