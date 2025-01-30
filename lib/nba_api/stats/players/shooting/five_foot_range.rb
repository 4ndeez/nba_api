# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Shooting
        module FiveFootRange
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguedashplayershotlocations"
          DISTANCE_RANGE = "5ft Range"

          def call(options = {})
            params = build_params(options.merge(distance_range: DISTANCE_RANGE))
            response = get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
