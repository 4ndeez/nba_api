# frozen_string_literal: true

require_relative "nba_api/version"
require_relative "nba_api/constants"
require_relative "nba_api/utils"
require_relative "nba_api/response_handler"
require_relative "nba_api/formatter"
require_relative "nba_api/resource"

# Errors
require_relative "nba_api/errors/invalid_parameter_error"

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

# Stats/Players/General API
require_relative "nba_api/stats/players/general/params"
require_relative "nba_api/stats/players/general/advanced"
require_relative "nba_api/stats/players/general/defense"
require_relative "nba_api/stats/players/general/misc"
require_relative "nba_api/stats/players/general/opponent"
require_relative "nba_api/stats/players/general/scoring"
require_relative "nba_api/stats/players/general/traditional"
require_relative "nba_api/stats/players/general/usage"
require_relative "nba_api/stats/players/general/violations"

# Stats/Players/Clutch API
require_relative "nba_api/stats/players/clutch/params"
require_relative "nba_api/stats/players/clutch/advanced"
require_relative "nba_api/stats/players/clutch/misc"
require_relative "nba_api/stats/players/clutch/scoring"
require_relative "nba_api/stats/players/clutch/traditional"
require_relative "nba_api/stats/players/clutch/usage"

# Stats/Players/Playtypes API
require_relative "nba_api/stats/players/playtypes/params"
require_relative "nba_api/stats/players/playtypes/cut"
require_relative "nba_api/stats/players/playtypes/handoff"
require_relative "nba_api/stats/players/playtypes/isolation"
require_relative "nba_api/stats/players/playtypes/misc"
require_relative "nba_api/stats/players/playtypes/off_screen"
require_relative "nba_api/stats/players/playtypes/pick_roll_ball_handler"
require_relative "nba_api/stats/players/playtypes/pick_roll_roll_man"
require_relative "nba_api/stats/players/playtypes/post_up"
require_relative "nba_api/stats/players/playtypes/putback"
require_relative "nba_api/stats/players/playtypes/spot_up"
require_relative "nba_api/stats/players/playtypes/transition"

# Stats/Players/Tracking API
require_relative "nba_api/stats/players/tracking/params"
require_relative "nba_api/stats/players/tracking/catch_shoot"
require_relative "nba_api/stats/players/tracking/drives"
require_relative "nba_api/stats/players/tracking/elbow_touches"
require_relative "nba_api/stats/players/tracking/paint_touches"
require_relative "nba_api/stats/players/tracking/passing"
require_relative "nba_api/stats/players/tracking/possessions"
require_relative "nba_api/stats/players/tracking/post_touches"
require_relative "nba_api/stats/players/tracking/pull_up_shots"
require_relative "nba_api/stats/players/tracking/rebounding"
require_relative "nba_api/stats/players/tracking/speed_distance"

# Stats/Players/Defense API
require_relative "nba_api/stats/players/defense/params"
require_relative "nba_api/stats/players/defense/overall"
require_relative "nba_api/stats/players/defense/three_pointers"
require_relative "nba_api/stats/players/defense/two_pointers"
require_relative "nba_api/stats/players/defense/under_fifteen_foot"
require_relative "nba_api/stats/players/defense/under_six_foot"
require_relative "nba_api/stats/players/defense/under_ten_foot"

# Stats/Players/Shooting API
require_relative "nba_api/stats/players/shooting/params"
require_relative "nba_api/stats/players/shooting/catch_shoot"
require_relative "nba_api/stats/players/shooting/general"
require_relative "nba_api/stats/players/shooting/pull_up"
require_relative "nba_api/stats/players/shooting/shotclock"
require_relative "nba_api/stats/players/shooting/under_ten_foot"

module NbaApi
  class Error < StandardError; end
end
