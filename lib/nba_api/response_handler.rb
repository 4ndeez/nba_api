module NbaApi
  module ResponseHandler
    RESULT_SETS_ENDPOINTS = %w[leaguegamefinder leaguedashplayerstats leaguedashplayerptshot]
    RESULT_AS_ENDPOINTS = %w[boxscoresummaryv3 boxscoresummaryv2 boxscoretraditionalv3 boxscoreadvancedv3 boxscoremiscv3
                             boxscorescoringv3 boxscoreusagev3 boxscorefourfactorsv3 boxscoreplayertrackv3
                             boxscorehustlev2 boxscoredefensivev2 boxscorematchupsv3]
    SHOT_LOCATIONS_ENDPOINT = %w[leaguedashplayershotlocations]

    UNVERSION_ENDPOINT = { 'boxscoresummaryv3' => :box_score_summary,
                           'boxscoresummaryv2' => :box_score_summary,
                           'boxscoretraditionalv3' => :box_score_traditional,
                           'boxscoreadvancedv3' => :box_score_advanced,
                           'boxscoremiscv3' => :box_score_misc,
                           'boxscorescoringv3' => :box_score_scoring,
                           'boxscoreusagev3' => :box_score_usage,
                           'boxscorefourfactorsv3' => :box_score_four_factors,
                           'boxscoreplayertrackv3' => :box_score_player_track,
                           'boxscorehustlev2' => :box_score_hustle,
                           'boxscoredefensivev2' => :box_score_defensive,
                           'boxscorematchupsv3' => :box_score_matchups
                          }.freeze

    class << self
      def call(endpoint, response)
        case endpoint
        when *RESULT_SETS_ENDPOINTS
          results_sets_process(response)
        when *RESULT_AS_ENDPOINTS
          result_as_endpoint_process(endpoint, response)
        when *SHOT_LOCATIONS_ENDPOINT
          shot_locations_process(response)
        else
          raise ArgumentError, "Unsupported endpoint: #{endpoint}"
        end
      end

      private

      def results_sets_process(response)
        result_sets = response.dig(:result_sets, 0)
        headers = result_sets[:headers].map { |header| header.downcase.to_sym }
        rows = result_sets[:row_set]
        result = rows.map { |row| headers.zip(row).to_h }
        unwrap_response(result)
      end

      def result_as_endpoint_process(endpoint, response)
        result_key = UNVERSION_ENDPOINT[endpoint]
        response[result_key]&.tap { |r| r&.delete(:broadcasters) } || response
      end

      def shot_locations_process(response)
        result_set = response[:result_sets]
        headers = result_set[:headers]
        shot_categories = headers[0][:column_names]
        column_names = headers[1][:column_names]
        rows = result_set[:row_set]

        result = rows.map do |row|
          player_data = column_names.zip(row).to_h
          shot_data = shot_categories.each_with_index.map do |category, index|
            start_index = 6 + index * 3
            {
              category => {
                fgm: row[start_index],
                fga: row[start_index + 1],
                fg_pct: row[start_index + 2]
              }
            }
          end.reduce({}, :merge)
          player_data.merge(shot_data)
        end

        unwrap_response(result)
      end

      def unwrap_response(response)
        response.is_a?(Array) && response.size == 1 ? response.first : response
      end
    end
  end
end
