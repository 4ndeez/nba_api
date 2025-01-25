module NbaApi
  module Errors
    class InvalidParameterError < StandardError
      def initialize(parameter_name, valid_options = nil)
        message = if valid_options && valid_options.any?
          "Invalid #{parameter_name}. Valid options: #{valid_options.join(", ")}"
        else
          "Invalid #{parameter_name}"
        end
        
        super(message)
      end
    end
  end
end
