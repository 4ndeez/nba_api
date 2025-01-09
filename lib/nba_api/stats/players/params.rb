# frozen_string_literal: true

module NbaApi
  module Stats
    module Players
      module Params
        extend Resource
        REQUIRED_PARAMS = %i[season].freeze

        private

        def get(endpoint, params)
          response = super
          unwrap_response(response)
        end

        def unwrap_response(response)
          response[:league_dash_pt_stats]
        end

        def build_params(options)
          verify_params(options)

          {
            Season: options[:season],
            SeasonType: options[:season_type] || "Regular Season",
            LeagueID: options[:league_id] || "00",
            PerMode: options[:per_mode] || "Totals",
            MeasureType: options[:measure_type] || "Base",
            LastNGames: options[:last_n_games] || 0,
            Month: options[:month] || 0,
            TeamID: options[:team_id] || 0,
            OpponentTeamID: options[:opponent_team_id] || 0,
            Period: options[:period] || 0,
            PlayerOrTeam: options[:player_or_team] || "Player",
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

          raise ArgumentError, "Missing parameters: #{missing_params.join(", ")}" if missing_params.any?
          if options[:date].present? && (options[:date_from].present? || options[:date_to].present?)
            raise ArgumentError, "Use either ONLY :date OR :date_from AND :date_to" 
          end
        end
      end
    end
  end
end
