# frozen_string_literal: true

module NbaApi
  class Formatter
    extend Constants

    class << self
      def prettify(endpoint, response)
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
        unwrap(result)
      end

      def result_as_endpoint_process(endpoint, response)
        result_key = UNVERSION[endpoint]
        response[result_key]
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

        unwrap(result)
      end

      def unwrap(response)
        response.is_a?(Array) && response.size == 1 ? response.first : response
      end
    end
  end
end
