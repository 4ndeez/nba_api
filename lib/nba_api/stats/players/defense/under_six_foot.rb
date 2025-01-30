# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Defense
        module UnderSixFoot
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguedashptdefend"
          CATEGORY = "Less Than 6Ft"

          def call(options = {})
            params = build_params(options.merge(category: CATEGORY))
            response = get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
