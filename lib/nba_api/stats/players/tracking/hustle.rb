# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Tracking
        module Hustle
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguehustlestatsplayer"

          def call(options = {})
            params = build_params(options)
            response = get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
