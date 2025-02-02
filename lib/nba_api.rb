# frozen_string_literal: true

require_relative "nba_api/version"
require_relative "nba_api/constants"
require_relative "nba_api/utils"
require_relative "nba_api/response_handler"
require_relative "nba_api/formatter"
require_relative "nba_api/resource"

# Errors
require_relative "nba_api/errors/invalid_parameter_error"
require_relative "nba_api/errors/missing_parameter_error"

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
require_relative "nba_api/team/history"
require_relative "nba_api/team/leaders"
require_relative "nba_api/team/roster"

# Player API
require_relative "nba_api/player/params"
require_relative "nba_api/player/info"

# Stats/Lineups API
require_relative "nba_api/stats/lineups/params"
require_relative "nba_api/stats/lineups/advanced"
require_relative "nba_api/stats/lineups/four_factors"
require_relative "nba_api/stats/lineups/misc"
require_relative "nba_api/stats/lineups/opponent"
require_relative "nba_api/stats/lineups/scoring"
require_relative "nba_api/stats/lineups/traditional"

# Stats/Teams/Clutch API
require_relative "nba_api/stats/teams/clutch/params"
require_relative "nba_api/stats/teams/clutch/advanced"
require_relative "nba_api/stats/teams/clutch/misc"
require_relative "nba_api/stats/teams/clutch/scoring"
require_relative "nba_api/stats/teams/clutch/traditional"
require_relative "nba_api/stats/teams/clutch/usage"

# Stats/Teams/Defense API
require_relative "nba_api/stats/teams/defense/params"
require_relative "nba_api/stats/teams/defense/overall"
require_relative "nba_api/stats/teams/defense/three_pointers"
require_relative "nba_api/stats/teams/defense/two_pointers"
require_relative "nba_api/stats/teams/defense/under_fifteen_foot"
require_relative "nba_api/stats/teams/defense/under_six_foot"
require_relative "nba_api/stats/teams/defense/under_ten_foot"

# Stats/Teams/General API
require_relative "nba_api/stats/teams/general/params"
require_relative "nba_api/stats/teams/general/advanced"
require_relative "nba_api/stats/teams/general/defense"
require_relative "nba_api/stats/teams/general/four_factors"
require_relative "nba_api/stats/teams/general/opponent"
require_relative "nba_api/stats/teams/general/misc"
require_relative "nba_api/stats/teams/general/scoring"
require_relative "nba_api/stats/teams/general/traditional"
require_relative "nba_api/stats/teams/general/violations"

# Stats/Teams/Playtypes API
require_relative "nba_api/stats/teams/playtypes/params"
require_relative "nba_api/stats/teams/playtypes/cut"
require_relative "nba_api/stats/teams/playtypes/handoff"
require_relative "nba_api/stats/teams/playtypes/isolation"
require_relative "nba_api/stats/teams/playtypes/misc"
require_relative "nba_api/stats/teams/playtypes/off_screen"
require_relative "nba_api/stats/teams/playtypes/pick_roll_ball_handler"
require_relative "nba_api/stats/teams/playtypes/pick_roll_roll_man"
require_relative "nba_api/stats/teams/playtypes/post_up"
require_relative "nba_api/stats/teams/playtypes/putback"
require_relative "nba_api/stats/teams/playtypes/spot_up"
require_relative "nba_api/stats/teams/playtypes/transition"

# Stats/Players/Shooting API
require_relative "nba_api/stats/teams/shooting/params"
require_relative "nba_api/stats/teams/shooting/by_zone"
require_relative "nba_api/stats/teams/shooting/catch_shoot"
require_relative "nba_api/stats/teams/shooting/closest_defender"
require_relative "nba_api/stats/teams/shooting/closest_defender_plus_ten"
require_relative "nba_api/stats/teams/shooting/dribble"
require_relative "nba_api/stats/teams/shooting/eight_foot_range"
require_relative "nba_api/stats/teams/shooting/five_foot_range"
require_relative "nba_api/stats/teams/shooting/general"
require_relative "nba_api/stats/teams/shooting/opponent_by_zone"
require_relative "nba_api/stats/teams/shooting/opponent_eight_foot_range"
require_relative "nba_api/stats/teams/shooting/opponent_five_foot_range"
require_relative "nba_api/stats/teams/shooting/pull_up"
require_relative "nba_api/stats/teams/shooting/shotclock"
require_relative "nba_api/stats/teams/shooting/touch_time"
require_relative "nba_api/stats/teams/shooting/under_ten_foot"

# Stats/Teams/Tracking API
require_relative "nba_api/stats/teams/tracking/params"
require_relative "nba_api/stats/teams/tracking/catch_shoot"
require_relative "nba_api/stats/teams/tracking/defensive_impact"
require_relative "nba_api/stats/teams/tracking/drives"
require_relative "nba_api/stats/teams/tracking/elbow_touches"
require_relative "nba_api/stats/teams/tracking/hustle"
require_relative "nba_api/stats/teams/tracking/paint_touches"
require_relative "nba_api/stats/teams/tracking/passing"
require_relative "nba_api/stats/teams/tracking/possessions"
require_relative "nba_api/stats/teams/tracking/post_touches"
require_relative "nba_api/stats/teams/tracking/pull_up_shots"
require_relative "nba_api/stats/teams/tracking/rebounding"
require_relative "nba_api/stats/teams/tracking/shooting_efficiency"
require_relative "nba_api/stats/teams/tracking/speed_distance"

# Stats/Players/Clutch API
require_relative "nba_api/stats/players/clutch/params"
require_relative "nba_api/stats/players/clutch/advanced"
require_relative "nba_api/stats/players/clutch/misc"
require_relative "nba_api/stats/players/clutch/scoring"
require_relative "nba_api/stats/players/clutch/traditional"
require_relative "nba_api/stats/players/clutch/usage"

# Stats/Players/Defense API
require_relative "nba_api/stats/players/defense/params"
require_relative "nba_api/stats/players/defense/overall"
require_relative "nba_api/stats/players/defense/three_pointers"
require_relative "nba_api/stats/players/defense/two_pointers"
require_relative "nba_api/stats/players/defense/under_fifteen_foot"
require_relative "nba_api/stats/players/defense/under_six_foot"
require_relative "nba_api/stats/players/defense/under_ten_foot"

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

# Stats/Players/Shooting API
require_relative "nba_api/stats/players/shooting/params"
require_relative "nba_api/stats/players/shooting/by_zone"
require_relative "nba_api/stats/players/shooting/catch_shoot"
require_relative "nba_api/stats/players/shooting/closest_defender"
require_relative "nba_api/stats/players/shooting/closest_defender_plus_ten"
require_relative "nba_api/stats/players/shooting/dribble"
require_relative "nba_api/stats/players/shooting/eight_foot_range"
require_relative "nba_api/stats/players/shooting/five_foot_range"
require_relative "nba_api/stats/players/shooting/general"
require_relative "nba_api/stats/players/shooting/opponent_by_zone"
require_relative "nba_api/stats/players/shooting/opponent_eight_foot_range"
require_relative "nba_api/stats/players/shooting/opponent_five_foot_range"
require_relative "nba_api/stats/players/shooting/pull_up"
require_relative "nba_api/stats/players/shooting/shotclock"
require_relative "nba_api/stats/players/shooting/touch_time"
require_relative "nba_api/stats/players/shooting/under_ten_foot"

# Stats/Players/Tracking API
require_relative "nba_api/stats/players/tracking/params"
require_relative "nba_api/stats/players/tracking/catch_shoot"
require_relative "nba_api/stats/players/tracking/defensive_impact"
require_relative "nba_api/stats/players/tracking/drives"
require_relative "nba_api/stats/players/tracking/elbow_touches"
require_relative "nba_api/stats/players/tracking/hustle"
require_relative "nba_api/stats/players/tracking/paint_touches"
require_relative "nba_api/stats/players/tracking/passing"
require_relative "nba_api/stats/players/tracking/possessions"
require_relative "nba_api/stats/players/tracking/post_touches"
require_relative "nba_api/stats/players/tracking/pull_up_shots"
require_relative "nba_api/stats/players/tracking/rebounding"
require_relative "nba_api/stats/players/tracking/shooting_efficiency"
require_relative "nba_api/stats/players/tracking/speed_distance"

module NbaApi
  class Error < StandardError; end
end
