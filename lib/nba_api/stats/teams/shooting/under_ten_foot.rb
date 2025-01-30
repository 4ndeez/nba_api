# frozen_string_literal: true

module NbaApi
  module Stats
    module Teams
      module Shooting
        module UnderTenFoot
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguedashteamptshot"
          CATEGORY = "Less Than 10 ft"

          def call(options = {})
            params = build_params(options.merge(category: CATEGORY))
            response = get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
