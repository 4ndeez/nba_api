# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Tracking
        module ShootingEfficiency
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguedashptstats"
          PT_MEASURE_TYPE = "Efficiency"

          def call(options = {})
            params = build_params(options.merge(pt_measure_type: PT_MEASURE_TYPE))
            response = get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
