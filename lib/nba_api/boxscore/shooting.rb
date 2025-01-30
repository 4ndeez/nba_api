# frozen_string_literal: true

module NbaApi
  module Boxscore
    module Shooting
      extend Resource
      extend Params

      ENDPOINT = "playbyplayv3"

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
          data.select! { |action| action[:is_field_goal] == 1 }
          result = data.group_by { |hash| hash[:player_name] }.map do |player_name, actions|
            {
              player_name: player_name,
              player_id: actions.first[:person_id],
              team_id: actions.first[:team_id],
              shots: actions.map do |action|
                shot_data = attributes(action)
                type_and_subtype = split_type_and_subtype(action[:sub_type])
                shot_data.merge(type_and_subtype)
              end
            }
          end
        end

        def attributes(entry)
          {
            action_id: entry[:action_id],
            action_type: entry[:action_type],
            type: entry[:sub_type],
            shot_result: entry[:shot_result],
            shot_value: entry[:shot_value],
            shot_distance: entry[:shot_distance],
            period: entry[:period],
            x: entry[:x_legacy],
            y: entry[:y_legacy]
          }
        end

        def split_type_and_subtype(shot_description)
          not_shots = ["Dunk", "Layup", "Fadeaway"]

          shot_array = shot_description.split
          if not_shots.include?(shot_array[-2])
            { type: shot_array[..-2].map(&:capitalize).join(" "), subtype: shot_array[-2] }
          else
            { type: shot_array[..-1].map(&:capitalize).join(" "), subtype: shot_array[-2..].map(&:capitalize).join(" ") }
          end
        end
      end
    end
  end
end
