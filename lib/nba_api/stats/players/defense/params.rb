# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Defense
        module Params
          extend Resource
          
          REQUIRED_PARAMS = %i[season category].freeze
          WRAPPED_ENDPOINTS = {
            "leaguedashptdefend" => :league_dash_pt_defend
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
              DefenseCategory: options[:category], # options: Overall, 3 Pointers, 2 Pointers, Less Than 6Ft, Less Than 10Ft, Greater Than 15Ft
              SeasonType: options[:season_type] || "Regular Season",
              LeagueID: options[:league_id] || "00",
              PerMode: options[:per_mode] || "Totals",
              LastNGames: options[:last_n_games] || 0,
              Month: options[:month] || 0,
              TeamID: options[:team_id] || 0,
              OpponentTeamID: options[:opponent_team_id] || 0,
              Period: options[:period] || 0,
              PtMeasureType: options[:pt_measure_type] || nil,
              PlusMinus: options[:plus_minus] || "N",
              Rank: options[:rank] || "N",
              PaceAdjust: options[:pace_adjust] || "N",

              DateFrom: options[:date_from] || options[:date] || nil,
              DateTo: options[:date_to] || options[:date] || nil,
            }
          end

          def verify_params(options)
            missing_params = REQUIRED_PARAMS - options.select { |_k, v| v.present? }.keys
            
            if missing_params.any?
              raise NbaApi::Errors::InvalidParameterError, "Missing parameters: #{missing_params.join(", ")}" 
            end

            if options[:date].present? && (options[:date_from].present? || options[:date_to].present?)
              raise NbaApi::Errors::InvalidParameterError, "Use either ONLY :date OR :date_from AND :date_to" 
            end
          end
        end
      end
    end
  end
end
