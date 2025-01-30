# frozen_string_literal: true

module NbaApi
  module Stats
    module Teams
      module General
        module FourFactors
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguedashteamstats"
          TYPE = { measure_type: "Four Factors" }.freeze

          def call(options = {})
            params = build_params(options.merge(TYPE))
            get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
