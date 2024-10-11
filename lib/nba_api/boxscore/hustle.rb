# frozen_string_literal: true

module NbaApi
  module Boxscore
    module Hustle
      extend Resource
      extend Params

      module_function

      ENDPOINT = "boxscorehustlev2"

      def call(options = {})
        params = build_params(options)
        get(ENDPOINT, params)
      end
    end
  end
end
