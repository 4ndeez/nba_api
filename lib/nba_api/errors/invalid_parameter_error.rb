module NbaApi
  module Errors
    class InvalidParameterError < StandardError
      def initialize(parameter, options = nil)
        @parameter = parameter
        @options = options
        @message = formed_message
        
        super(@message)
      end

      private

      def stringified_options
        case @options
        when Array
          @options.join(", ")
        when Hash
          @options.keys.join(", ")
        end
      end

      def formed_message
        if @options && @options.any?
          "Invalid #{@parameter}. Valid options: #{stringified_options}"
        else
          "Invalid #{@parameter}"
        end
      end
    end
  end
end
