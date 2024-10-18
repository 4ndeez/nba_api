# frozen_string_literal: true

module NbaApi
  module League
    module Params
      REQUIRED_PARAMS = [:season].freeze

      private

      def build_params(options)
        verify_params(options)

        {
          Season: options[:season],
          SeasonType: options[:season_type] || "Regular Season",
          LeagueID: options[:league_id] || "00"
        }
      end

      def verify_params(options)
        missing_params = REQUIRED_PARAMS - options.select { |_k, v| v.present? }.keys

        raise ArgumentError, "Missing parameters: #{missing_params.join(", ")}" if missing_params.any?
      end
    end
  end
end
