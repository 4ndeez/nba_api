# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Shooting
        module General
          extend Resource
          extend Params

          module_function

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
