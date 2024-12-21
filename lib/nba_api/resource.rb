# frozen_string_literal: true

require_relative "request"
require_relative "response"

module NbaApi
  module Resource
    extend Request
    extend Response

    def get(endpoint, params = {})
      response = Request.get(endpoint, params)
      Formatter.prettify(endpoint, response)
    end

    def get_static(endpoint, params = {})
      response = Request.get_static(endpoint, params)
      Formatter.prettify_static(endpoint, response)
    end
  end
end
