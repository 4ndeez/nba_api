# frozen_string_literal: true

require_relative "nba_api/version"
require_relative "nba_api/constants"
require_relative "nba_api/utils"
require_relative "nba_api/formatter"
require_relative "nba_api/resource"

# Boxscore API
require_relative "nba_api/boxscore/params"
require_relative "nba_api/boxscore/advanced"
require_relative "nba_api/boxscore/defense"
require_relative "nba_api/boxscore/four_factors"
require_relative "nba_api/boxscore/hustle"
require_relative "nba_api/boxscore/matchups"
require_relative "nba_api/boxscore/misc"
require_relative "nba_api/boxscore/player_tracking"
require_relative "nba_api/boxscore/scoring"
require_relative "nba_api/boxscore/traditional"
require_relative "nba_api/boxscore/usage"

module NbaApi
  class Error < StandardError; end
end
