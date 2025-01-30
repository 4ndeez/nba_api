# frozen_string_literal: true

module NbaApi
  module Stats
    module Teams
      module Shooting
        module Params
          extend Resource
          include Constants
          
          REQUIRED_PARAMS   = %i[season].freeze
          WRAPPED_ENDPOINTS = { "leaguedashteamptshot" => :league_dash_pt_shots }.freeze

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
              GeneralRange: options[:category] || nil,
              CloseDefDistRange: CLOSEST_DEFENDER_RANGE_PARAMS[options[:defender_range]],
              ShotClockRange: SHOTCLOCK_RANGE_PARAMS[options[:shotclock_range]],
              DribbleRange: DRIBBLE_RANGE_PARAMS[options[:dribble_range]],
              TouchTimeRange: TOUCH_TIME_RANGE_PARAMS[options[:touch_time_range]],
              ShotDistRange: SHOT_DISTANCE_RANGE_PARAMS[options[:shot_distance]],
              DistanceRange: options[:distance_range] || nil,
              SeasonType: options[:season_type] || "Regular Season",
              LeagueID: options[:league_id] || "00",
              PerMode: options[:per_mode] || "Totals",
              LastNGames: options[:last_n_games] || 0,
              Month: options[:month] || 0,
              TeamID: options[:team_id] || 0,
              OpponentTeamID: options[:opponent_team_id] || 0,
              Period: options[:period] || 0,
              PtMeasureType: options[:pt_measure_type] || nil,
              MeasureType: options[:measure_type] || "Base",
              PlusMinus: options[:plus_minus] || "N",
              Rank: options[:rank] || "N",
              PaceAdjust: options[:pace_adjust] || "N",

              DateFrom: options[:date_from] || options[:date] || nil,
              DateTo: options[:date_to] || options[:date] || nil,
            }
          end

          def verify_params(options)
            check_missing_params(options)
            check_param_validity(:defender_range, options[:defender_range], CLOSEST_DEFENDER_RANGE_PARAMS)
            check_param_validity(:shotclock_range, options[:shotclock_range], SHOTCLOCK_RANGE_PARAMS)
            check_param_validity(:dribble_range, options[:dribble_range], DRIBBLE_RANGE_PARAMS)
            check_param_validity(:touch_time_range, options[:touch_time_range], TOUCH_TIME_RANGE_PARAMS)
            check_param_validity(:shot_distance, options[:shot_distance], SHOT_DISTANCE_RANGE_PARAMS)
          end

          def check_param_validity(param_name, param_value, valid_data)
            if param_value.present? && valid_data.exclude?(param_value)
              raise NbaApi::Errors::InvalidParameterError.new(param_name, valid_data)
            end
          end

          def check_missing_params(params)
            missing_params = REQUIRED_PARAMS - params.keys.select { |key| params[key].present? }

            raise NbaApi::Errors::MissingParameterError.new(missing_params) if missing_params.any?
          end
        end
      end
    end
  end
end
