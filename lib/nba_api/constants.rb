# frozen_string_literal: true

module NbaApi
  module Constants
    RESULT_SETS_ENDPOINTS = %w[leaguegamefinder leaguedashplayerstats leaguedashplayerptshot winprobabilitypbp].freeze
    RESULT_AS_ENDPOINTS = %w[boxscoresummaryv3 boxscoresummaryv2 boxscoretraditionalv3 boxscoreadvancedv3 boxscoremiscv3
                             boxscorescoringv3 boxscoreusagev3 boxscorefourfactorsv3 boxscoreplayertrackv3
                             boxscorehustlev2 boxscoredefensivev2 boxscorematchupsv3].freeze
    SHOT_LOCATIONS_ENDPOINT = %w[leaguedashplayershotlocations].freeze

    UNVERSION = { "boxscoresummaryv3" => :box_score_summary,
                  "boxscoresummaryv2" => :box_score_summary,
                  "boxscoretraditionalv3" => :box_score_traditional,
                  "boxscoreadvancedv3" => :box_score_advanced,
                  "boxscoremiscv3" => :box_score_misc,
                  "boxscorescoringv3" => :box_score_scoring,
                  "boxscoreusagev3" => :box_score_usage,
                  "boxscorefourfactorsv3" => :box_score_four_factors,
                  "boxscoreplayertrackv3" => :box_score_player_track,
                  "boxscorehustlev2" => :box_score_hustle,
                  "boxscoredefensivev2" => :box_score_defensive,
                  "boxscorematchupsv3" => :box_score_matchups }.freeze

    TEAMS = [
      { abbreviation: "ATL", id: 1_610_612_737, name: "Atlanta Hawks" },
      { abbreviation: "BKN", id: 1_610_612_751, name: "Brooklyn Nets" },
      { abbreviation: "BOS", id: 1_610_612_738, name: "Boston Celtics" },
      { abbreviation: "CHA", id: 1_610_612_766, name: "Charlotte Hornets" },
      { abbreviation: "CHI", id: 1_610_612_741, name: "Chicago Bulls" },
      { abbreviation: "CLE", id: 1_610_612_739, name: "Cleveland Cavaliers" },
      { abbreviation: "DAL", id: 1_610_612_742, name: "Dallas Mavericks" },
      { abbreviation: "DEN", id: 1_610_612_743, name: "Denver Nuggets" },
      { abbreviation: "DET", id: 1_610_612_765, name: "Detroit Pistons" },
      { abbreviation: "GSW", id: 1_610_612_744, name: "Golden State Warriors" },
      { abbreviation: "HOU", id: 1_610_612_745, name: "Houston Rockets" },
      { abbreviation: "IND", id: 1_610_612_754, name: "Indiana Pacers" },
      { abbreviation: "LAC", id: 1_610_612_746, name: "LA Clippers" },
      { abbreviation: "LAL", id: 1_610_612_747, name: "Los Angeles Lakers" },
      { abbreviation: "MEM", id: 1_610_612_763, name: "Memphis Grizzlies" },
      { abbreviation: "MIA", id: 1_610_612_748, name: "Miami Heat" },
      { abbreviation: "MIL", id: 1_610_612_749, name: "Milwaukee Bucks" },
      { abbreviation: "MIN", id: 1_610_612_750, name: "Minnesota Timberwolves" },
      { abbreviation: "NOP", id: 1_610_612_740, name: "New Orleans Pelicans" },
      { abbreviation: "NYK", id: 1_610_612_752, name: "New York Knicks" },
      { abbreviation: "OKC", id: 1_610_612_760, name: "Oklahoma City Thunder" },
      { abbreviation: "ORL", id: 1_610_612_753, name: "Orlando Magic" },
      { abbreviation: "PHI", id: 1_610_612_755, name: "Philadelphia 76ers" },
      { abbreviation: "PHX", id: 1_610_612_756, name: "Phoenix Suns" },
      { abbreviation: "POR", id: 1_610_612_757, name: "Portland Trail Blazers" },
      { abbreviation: "SAC", id: 1_610_612_758, name: "Sacramento Kings" },
      { abbreviation: "SAS", id: 1_610_612_759, name: "San Antonio Spurs" },
      { abbreviation: "TOR", id: 1_610_612_761, name: "Toronto Raptors" },
      { abbreviation: "UTA", id: 1_610_612_762, name: "Utah Jazz" },
      { abbreviation: "WAS", id: 1_610_612_764, name: "Washington Wizards" }
    ].freeze
  end
end
