# frozen_string_literal: true

require_relative "nba_api/version"
require_relative "nba_api/constants"
require_relative "nba_api/utils"
require_relative "nba_api/response_handler"
require_relative "nba_api/formatter"
require_relative "nba_api/resource"

# League API
require_relative "nba_api/league/params"
require_relative "nba_api/league/schedule"
require_relative "nba_api/league/standings"

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
require_relative "nba_api/boxscore/shooting"
require_relative "nba_api/boxscore/traditional"
require_relative "nba_api/boxscore/usage"

# Game API
require_relative "nba_api/game/params"
require_relative "nba_api/game/details"
require_relative "nba_api/game/play_by_play"
require_relative "nba_api/game/play_by_play_win_probability"

# Team API
require_relative "nba_api/team/params"
require_relative "nba_api/team/details"
require_relative "nba_api/team/gamelogs"
require_relative "nba_api/team/leaders"
require_relative "nba_api/team/roster"

# Player API
require_relative "nba_api/player/params"
require_relative "nba_api/player/info"

# Stats/Teams API
require_relative "nba_api/stats/teams/params"
require_relative "nba_api/stats/teams/advanced"
require_relative "nba_api/stats/teams/defense"
require_relative "nba_api/stats/teams/four_factors"
require_relative "nba_api/stats/teams/opponent"
require_relative "nba_api/stats/teams/misc"
require_relative "nba_api/stats/teams/scoring"
require_relative "nba_api/stats/teams/traditional"
require_relative "nba_api/stats/teams/violations"
require_relative "nba_api/stats/teams/history"

# Stats/Players API
require_relative "nba_api/stats/players/params"
require_relative "nba_api/stats/players/catch_shoot"
require_relative "nba_api/stats/players/drives"
require_relative "nba_api/stats/players/elbow_touches"
require_relative "nba_api/stats/players/paint_touches"
require_relative "nba_api/stats/players/passing"
require_relative "nba_api/stats/players/possessions"
require_relative "nba_api/stats/players/post_touches"
require_relative "nba_api/stats/players/pull_up_shots"
require_relative "nba_api/stats/players/rebounding"
require_relative "nba_api/stats/players/speed_distance"
require_relative "nba_api/stats/players/traditional"

module NbaApi
  class Error < StandardError; end
end
