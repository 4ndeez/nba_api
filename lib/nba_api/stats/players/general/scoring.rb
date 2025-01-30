# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module General
        module Scoring
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguedashplayerstats"
          MEASURE_TYPE = "Scoring"

          def call(options = {})
            params = build_params(options.merge(measure_type: MEASURE_TYPE))
            get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
