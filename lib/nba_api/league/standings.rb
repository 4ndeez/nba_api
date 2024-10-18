# freeze_string_literal: true

module NbaApi
  module League
    module Standings
      extend Resource
      extend Params

      module_function

      ENDPOINT = "leaguestandingsv3"

      def call(options = {})
        params = build_params(options)
        get(ENDPOINT, params)
      end
    end
  end
end
