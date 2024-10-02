require 'httparty'
require 'json'
require 'zlib'
require 'stringio'
require_relative 'utils'

module NbaApi
  module Boxscore
    BASE_URL = 'https://stats.nba.com/stats'

    class << self
      def traditional(game_id)
        get_boxscore('boxscoretraditionalv3', game_id)
      end
      
      def advanced(game_id)
        get_boxscore('boxscoreadvancedv3', game_id)
      end

      def misc(game_id)
        get_boxscore('boxscoremiscv3', game_id)
      end

      def scoring(game_id)
        get_boxscore('boxscorescoringv3', game_id)
      end

      def usage(game_id)
        get_boxscore('boxscoreusagev3', game_id)
      end
      
      def four_factors(game_id)
        get_boxscore('boxscorefourfactorsv3', game_id)
      end

      def player_track(game_id)
        get_boxscore('boxscoreplayertrackv3', game_id)
      end

      def hustle(game_id)
        get_boxscore('boxscorehustlev2', game_id)
      end

      def defense(game_id)
        get_boxscore('boxscoredefensivev2', game_id)
      end

      def matchups(game_id)
        get_boxscore('boxscorematchupsv3', game_id)
      end

      private

      def get_boxscore(endpoint, game_id)
        Utils.make_request(endpoint, { GameID: game_id })
      end
    end
  end
end
