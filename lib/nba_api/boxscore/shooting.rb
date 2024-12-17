# frozen_string_literal: true

module NbaApi
  module Boxscore
    module Shooting
      extend Resource
      extend Params

      ENDPOINT = "playbyplayv3"
      MAX_QUARTERS = 14

      class << self
        def call(options = {})
          params = build_params(options)
          response = get(ENDPOINT, params)

          collect_shots(response)
        end

        private

        def build_params(options)
          raise "game_id is required" if options[:game_id].nil?

          {
            GameID: options[:game_id],
            StartPeriod: options[:start_period] || 1,
            EndPeriod: options[:end_period] || MAX_QUARTERS
          }
        end

        def collect_shots(data)
          shots = Hash.new { |h, k| h[k] = [] }
          data.each do |action|
            next unless action[:is_field_goal] == 1

            shots[{ player_name: action[:player_name_i], player_id: action[:person_id], team_id: action[:team_id] }] << attributes(action)
          end
          shots
        end

        def attributes(entry)
          {
            action_id: entry[:action_id],
            action_type: entry[:action_type],
            type: entry[:sub_type],
            shot_result: entry[:shot_result],
            shot_value: entry[:shot_value],
            shot_distance: entry[:shot_distance],
            points_total: entry[:points_total],
            period: entry[:period],
            x: entry[:x_legacy],
            y: entry[:y_legacy]
          }
        end
      end
    end
  end
end
