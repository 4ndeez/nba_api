# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Traditional
        extend Resource
        extend Params

        module_function

        ENDPOINT = "leaguedashplayerstats"

        def call(options = {})
          params = build_params(options)
          get(ENDPOINT, params)
        end
      end
    end
  end
end
