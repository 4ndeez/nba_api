module NbaApi
  module Errors
    class MissingParameterError < StandardError
      def initialize(parameters)
        @parameters = parameters
        
        super(@message)
      end

      private

      def stringified_parameters
        @parameters.join(", ")
      end

      def formed_message
        "Missing pararameters: #{strigified_parameters}"
      end
    end
  end
end
