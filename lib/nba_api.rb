# frozen_string_literal: true

require_relative 'nba_api/version'
require_relative 'nba_api/utils'
require_relative 'nba_api/boxscore'
require_relative 'nba_api/constants'
require_relative 'nba_api/game'
require_relative 'nba_api/player_dash'
require_relative 'nba_api/response_handler'

module NbaApi
  class Error < StandardError; end
end
