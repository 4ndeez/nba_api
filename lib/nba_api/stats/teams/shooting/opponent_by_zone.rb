# frozen_string_literal: true

module NbaApi
  module Stats
    module Teams
      module Shooting
        module OpponentByZone
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguedashteamshotlocations"
          DISTANCE_RANGE = "By Zone"
          MEASURE_TYPE = "Opponent"

          def call(options = {})
            params = build_params(options.merge(distance_range: DISTANCE_RANGE, measure_type: MEASURE_TYPE))
            response = get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
