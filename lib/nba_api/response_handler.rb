# frozen_string_literal: true

module NbaApi
  module ResponseHandler
    extend self

    def check_sufficiency(response)
      return false_response(response) if teams_empty?(response)
      return false_response(response) if players_empty?(response)
      return false_response(response) if insufficient_statistics?(response)
      
      true_response(response)
    end

    def teams_empty?(response)
      response[:home_team].nil? || response[:home_team].empty? || response[:away_team].nil?|| response[:away_team].empty?
    end

    def players_empty?(response)
      response[:home_team][:players].empty? || response[:away_team][:players].empty?
    end

    def insufficient_statistics?(response)
      return false if response[:home_team][:players].any? { |player| player.key?(:matchups) }

      all_players = response[:home_team][:players] + response[:away_team][:players]
      
      all_players.all? do |player|
        stats = player[:statistics].values
        zero_count = stats.count { |value| value.to_f.zero? }
        
        (zero_count.to_f / stats.length) > 0.65
      end
    end

    def true_response(response)
      { result: true }.merge(response)
    end

    def false_response(response)
      { result: false }.merge(response)
    end
  end
end
