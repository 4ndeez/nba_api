# frozen_string_literal: true

module NbaApi
  module Stats
    module Teams
      module Defense
        module Overall
          extend Resource
          extend Params

          module_function

          ENDPOINT = "leaguedashptteamdefend"
          CATEGORY = "Overall"

          def call(options = {})
            params = build_params(options.merge(category: CATEGORY))
            response = get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
