# frozen_string_literal: true

module NbaApi
  module Game
    module PlayByPlayWinProbability
      extend Resource
      extend Params

      ENDPOINT = "winprobabilitypbp"

      class << self
        def call(options = {})
          params = build_params(options)
          get(ENDPOINT, params)
        end

        private

        def build_params(options)
          raise "game_id is required" if options[:game_id].nil?

          { 
            GameID: options[:game_id],
            RunType: options[:run_type] || "each second"
           }
        end
      end
    end
  end
end
