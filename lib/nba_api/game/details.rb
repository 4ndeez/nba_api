# frozen_string_literal: true

module NbaApi
  module Game
    module Details
      extend Resource
      extend Params

      ENDPOINT = "boxscoresummaryv3"

      class << self
        def call(options = {})
          params = build_params(options)
          get(ENDPOINT, params)
        end
      end
    end
  end
end
