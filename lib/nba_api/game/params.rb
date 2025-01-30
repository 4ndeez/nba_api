# frozen_string_literal: true

module NbaApi
  module Game
    module Params
      include Constants

      REQUIRED_PARAMS = [:game_id].freeze

      private

      def build_params(options)
        verify_params(options)

        {
          GameID: options[:game_id],
          StartPeriod: options[:start_period] || 1,
          EndPeriod: options[:end_period] || MAX_QUARTERS
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
