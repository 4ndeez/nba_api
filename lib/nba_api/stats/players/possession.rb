# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Possession
        extend Resource
        extend Params

        module_function

        ENDPOINT = "leaguedashptstats"
        PT_MEASURE_TYPE = "Possessions"

        def call(options = {})
          params = build_params(options.merge(pt_measure_type: PT_MEASURE_TYPE))
          response = get(ENDPOINT, params)
          unwrap_response(response)
        end

        def unwrap_response(response)
          response[:league_dash_pt_stats]
        end
      end
    end
  end
end
