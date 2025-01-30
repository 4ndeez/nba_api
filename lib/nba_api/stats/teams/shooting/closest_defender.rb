# frozen_string_literal: true

module NbaApi
  module Stats
    module Teams
      module Shooting
        module ClosestDefender
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguedashteamptshot"

          def call(options = {})
            params = build_params(options)
            response = get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
