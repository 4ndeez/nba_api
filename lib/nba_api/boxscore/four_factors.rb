# frozen_string_literal: true

module NbaApi
  module Boxscore
    module FourFactors
      extend Resource
      extend Params

      module_function

      ENDPOINT = "boxscorefourfactorsv3"

      def call(options = {})
        params = build_params(options)
        get(ENDPOINT, params)
      end
    end
  end
end