# frozen_string_literal: true

module NbaApi
  module Game
    module PlayByPlay
      extend Resource
      extend Params

      module_function

      ENDPOINT = "playbyplayv3"

      def call(options = {})
        params = build_params(options)
        get(ENDPOINT, params)
      end
    end
  end
end
