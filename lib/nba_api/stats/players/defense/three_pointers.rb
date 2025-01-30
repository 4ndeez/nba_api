# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Defense
        module ThreePointers
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguedashptdefend"
          CATEGORY = "3 Pointers"

          def call(options = {})
            params = build_params(options.merge(category: CATEGORY))
            response = get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
