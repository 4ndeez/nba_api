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
          LeagueID: options[:league_id] || "00"
        }
      end

      def verify_params(options)
        missing_params = REQUIRED_PARAMS - options.select { |_k, v| v.present? }.keys

        if missing_params.any?
          raise NbaApi::Errors::InvalidParameterError, "Missing parameters: #{missing_params.join(", ")}"
        end
      end
    end
  end
end
