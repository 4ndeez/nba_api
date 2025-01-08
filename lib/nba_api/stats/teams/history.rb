# frozen_string_literal: true

module NbaApi
  module Stats
    module Teams
      module History
        extend Resource
        extend Params

        module_function

        ENDPOINT = "franchisehistory"

        def call
          params = { LeagueID: "00" }
          get(ENDPOINT, params)
        end
      end
    end
  end
end
