# frozen_string_literal: true

module NbaApi
  module Boxscore
    module Params
      def build_params(options)
        raise "game_id is required" if options[:game_id].nil?

        {
          GameID: options[:game_id],
          StartPeriod: options[:quarter] || 1,
          EndPeriod: options[:quarter] || 1,
          StartRange: 0,
          EndRange: 0,
          RangeType: options[:quarter] ? 1 : 0
        }
      end
    end
  end
end
