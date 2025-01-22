# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Clutch
        module Usage

          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguedashplayerclutch"
          MEASURE_TYPE = "Usage"

          def call(options = {})
            params = build_params(options.merge(measure_type: MEASURE_TYPE))
            get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
