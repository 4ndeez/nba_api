# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Shooting
        module CatchShoot
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguedashplayerptshot"
          CATEGORY = "Catch and Shoot"

          def call(options = {})
            params = build_params(options.merge(category: CATEGORY))
            response = get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
