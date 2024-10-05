module NbaApi
  module Boxscore
    class << self
      def traditional(options = {})
        endpoint = 'boxscoretraditionalv3'
        make_request(endpoint, options)
      end
      
      def advanced(options = {})
        endpoint = 'boxscoreadvancedv3'
        make_request(endpoint, options)
      end

      def misc(options = {})
        endpoint = 'boxscoremiscv3'
        make_request(endpoint, options)
      end

      def scoring(options = {})
        endpoint = 'boxscorescoringv3'
        make_request(endpoint, options)
      end

      def usage(options = {})
        endpoint = 'boxscoreusagev3'
        make_request(endpoint, options)
      end
      
      def four_factors(options = {})
        endpoint = 'boxscorefourfactorsv3'
        make_request(endpoint, options)
      end

      def player_track(options = {})
        endpoint = 'boxscoreplayertrackv3'
        make_request(endpoint, options)
      end

      def hustle(options = {})
        endpoint = 'boxscorehustlev2'
        make_request(endpoint, options)
      end

      def defense(options = {})
        endpoint = 'boxscoredefensivev2'
        make_request(endpoint, options)
      end

      def matchups(options = {})
        endpoint = 'boxscorematchupsv3'
        make_request(endpoint, options)
      end

      private

      def make_request(endpoint, params)
        params = build_params(params)
        response = Utils.make_request(endpoint, params)
        ResponseHandler.call(endpoint, response)
      end

      def build_params(options)
        raise 'Game ID is required' if options[:game_id].nil?

        params = {
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
