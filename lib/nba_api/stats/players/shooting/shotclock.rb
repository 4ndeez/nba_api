# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Shooting
        module Shotclock
          extend Resource
          extend Params

          module_function

          REQUIRED_PARAMS = [:season].freeze
          ENDPOINT = "leaguedashplayerptshot"

          def call(options = {})
            params = build_params(options)
            response = get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
