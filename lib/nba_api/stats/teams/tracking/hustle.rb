# frozen_string_literal: true

module NbaApi
  module Stats
    module Teams
      module Tracking
        module Hustle
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguehustlestatsteam"

          def call(options = {})
            params = build_params(options)
            response = get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
