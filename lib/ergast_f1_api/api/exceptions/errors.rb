
module ErgastF1Api
  module Api
    module Exceptions
      PREFIX = 'ErgastF1Api'.freeze

      # Client error
      class ClientError < StandardError
        def initialize(response)
          msg = "#{PREFIX} Client side Error: #{response[:status]} for requests #{response[:url]}. "\
          "Body: #{response[:body]}"
          super(msg)
        end
      end

      # Server Error
      class ServerError < StandardError
        def initialize(response)
          msg = "#{PREFIX} Server side Error: #{response[:status]} for requests #{response[:url]}. "\
          "Ergast F1 Api says: #{response[:body]}"
          super(msg)
        end
      end

      # Unknown Error
      class UnknownError < StandardError
        def initialize(response)
          msg = "#{PREFIX} Unknown Error: #{response[:status]} for requests #{response[:url]}. "\
          "Ergast F1 Api says: #{response[:body]}"
          super(msg)
        end
      end
    end
  end
end
