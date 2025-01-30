# frozen_string_literal: true

module NbaApi
  module Stats
    module Teams
      module General
        module Opponent
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguedashteamstats"
          TYPE = { measure_type: "Opponent" }.freeze

          def call(options = {})
            params = build_params(options.merge(TYPE))
            get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
