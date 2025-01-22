# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Playtypes
        module Transition

          extend Resource
          extend Params

          module_function

          ENDPOINT = "synergyplaytypes"
          PLAY_TYPE = "Transition"

          def call(options = {})
            params = build_params(options.merge(play_type: PLAY_TYPE))
            get(ENDPOINT, params)
          end
        end
      end
    end
  end
end
