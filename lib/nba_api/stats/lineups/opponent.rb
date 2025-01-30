# frozen_string_literal: true

module NbaApi
  module Stats
    module Lineups
      module Opponent
        extend Resource
        extend Params

        module_function

        ENDPOINT = "leaguedashlineups"
        MEASURE_TYPE = "Opponent"

        def call(options = {})
          params = build_params(options.merge(measure_type: MEASURE_TYPE))
          get(ENDPOINT, params)
        end
      end
    end
  end
end
