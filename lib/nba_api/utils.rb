# frozen_string_literal: true

require "active_support/core_ext/string/inflections"
require "date"

module NbaApi
  module Utils
    extend Constants

    class << self
      def format_date(date)
        case date
        when String
          Date.parse(date).strftime("%m/%d/%Y")
        when Date
          date.strftime("%m/%d/%Y")
        when Time, DateTime
          date.to_date.strftime("%m/%d/%Y")
        else
          raise ArgumentError, "Invalid date format: #{date}"
        end
      end

      def team_to_team_id(team)
        find_team_by_abbreviation(team) || find_team_by_name(team)
      end

      def find_team_by_abbreviation(abbreviation)
        TEAMS.find { |team| team[:abbreviation] == abbreviation.upcase }&.dig(:id)
      end

      def find_team_by_name(name)
        TEAMS.find { |team| team[:name].downcase == name.downcase }&.dig(:id)
      end
    end
  end
end
