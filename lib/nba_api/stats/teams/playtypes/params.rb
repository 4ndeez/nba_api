# frozen_string_literal: true

module NbaApi
  module Stats
    module Teams
      module Playtypes
        module Params
          extend Resource
          
          REQUIRED_PARAMS = %i[season play_type type_grouping].freeze
          WRAPPED_ENDPOINTS = {
            "synergyplaytypes" => :synergy_play_type
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
              SeasonYear: options[:season],
              PlayType: options[:play_type], # options: Transition, Isolation, PRBallHandler, PRRollMan, PostUp, SpotUp, HandOff, Cut, OffScreen, Putbacks, PlayTypeMisc
              TypeGrouping: options[:type_grouping], # options: offensive, defensive
              SeasonType: options[:season_type] || "Regular Season",
              LeagueID: options[:league_id] || "00",
              PerMode: options[:per_mode] || "Totals",
              PlayerOrTeam: options[:player_or_team] || "T"
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
