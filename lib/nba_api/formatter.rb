# frozen_string_literal: true

module NbaApi
  class Formatter
    extend Constants
    extend ResponseHandler

    class << self
      def prettify(endpoint, response)
        case endpoint
        when *RESULT_SETS_ENDPOINTS
          results_sets_process(response)
        when *RESULT_AS_ENDPOINTS
          result_as_endpoint_process(endpoint, response)
        when *BOXSCORE_STATS_ENDPOINTS
          boxscore_process(endpoint, response)
        when *SHOT_LOCATIONS_ENDPOINT
          shot_locations_process(response)
        when *PBP_ENDPOINT
          pbp_process(response)
        when endpoint.include?(STATIC_ENDPOINT)
          static_process(response)
        else
          raise ArgumentError, "Unsupported endpoint: #{endpoint}"
        end
      end

      def prettify_static(_endpoint, response)
        static_process(response)
      end

      private

      def results_sets_process(response)
        result = {}
        response[:result_sets].each do |set|
          key = set[:name].underscore.to_sym
          headers = set[:headers].map(&:underscore).map(&:to_sym)
          rows = set[:row_set].map { |row| headers.zip(row).to_h }
          result[key] = rows.size == 1 ? rows.first : rows
        end
        result
      end

      def result_as_endpoint_process(endpoint, response)
        result_key = UNVERSION[endpoint]
        response[result_key]
      end

      def shot_locations_process(response)
        result_set = response[:result_sets]
        headers = result_set[:headers]
        
        shot_categories = headers.find { |h| h[:name] == 'SHOT_CATEGORY' }[:column_names]
        columns_to_skip = headers.find { |h| h[:name] == 'SHOT_CATEGORY' }[:columns_to_skip]

        column_names = headers.find { |h| h[:name] == 'columns' }[:column_names]
        column_names = column_names.map(&:underscore).map(&:to_sym)

        rows = result_set[:row_set]

        result = rows.map do |row|
          player_or_team_data = column_names.first(columns_to_skip).zip(row.first(columns_to_skip)).to_h

          shot_data = shot_categories.each_with_index.map do |category, index|
            start_index = columns_to_skip + index * 3
            {
              category => {
                fgm: row[start_index],
                fga: row[start_index + 1],
                fg_pct: row[start_index + 2]
              }
            }
          end.reduce({}, :merge)

          player_or_team_data.merge(shots: shot_data)
        end

        unwrap(result)
      end

      def boxscore_process(endpoint, response)
        result = result_as_endpoint_process(endpoint, response)
        check_sufficiency(result)
      end

      def pbp_process(response)
        result = response.dig(:game, :actions)
        unwrap(result)
      end

      def static_process(response)
        response["lscd"].each do |month_data|
          month_data["mscd"]["g"].each do |game|
            game.delete("bd")
          end
        end

        unwrap(response)
      end

      def unwrap(response)
        response.is_a?(Array) && response.size == 1 ? response.first : response
      end
    end
  end
end
