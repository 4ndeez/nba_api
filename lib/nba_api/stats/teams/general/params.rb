# frozen_string_literal: true

module NbaApi
  module Stats
    module Teams
      module General
        module Params
          REQUIRED_PARAMS = %i[season].freeze
          WRAPPED_ENDPOINTS = {
            "leaguedashteamstats" => :league_dash_team_stats
          }.freeze
          
          private

          def get(endpoint, params)
            response = super
            unwrap_response(endpoint, response)
          end

          def unwrap_response(endpoint, response)
            if WRAPPED_ENDPOINTS.keys.include?(endpoint)
              response_key = WRAPPED_ENDPOINTS[endpoint]
              response[response_key]
            else
              response
            end
          end

          def build_params(options)
            verify_params(options)

            {
              Season: options[:season],
              MeasureType: options[:measure_type],
              SeasonType: options[:season_type] || "Regular Season",
              PerMode: options[:per_mode] || "Totals",
              LastNGames: options[:last_n_games] || 0,
              Month: options[:month] || 0,
              OpponentTeamID: options[:opponent_team_id] || 0,
              Period: options[:period] || 0,
              PlusMinus: options[:plus_minus] || "N",
              Rank: options[:rank] || "N",
              PaceAdjust: options[:pace_adjust] || "N"
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
  end
end
