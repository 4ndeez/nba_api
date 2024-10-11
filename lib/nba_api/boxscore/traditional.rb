# frozen_string_literal: true

module NbaApi
  module Boxscore
    module Traditional
      extend Resource
      extend Params

      module_function

      ENDPOINT = "boxscoretraditionalv3"

      def call(options = {})
        params = build_params(options)
        get(ENDPOINT, params)
      end
    end
  end
end
