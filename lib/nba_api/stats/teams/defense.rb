# frozen_string_literal: true

module NbaApi
  module Stats
    module Teams
      module Defense
        extend Resource
        extend Params

        module_function

        ENDPOINT = "leaguedashteamstats"
        TYPE = { measure_type: "Defense" }.freeze

        def call(options = {})
          params = build_params(options.merge(TYPE))
          get(ENDPOINT, params)
        end
      end
    end
  end
end
