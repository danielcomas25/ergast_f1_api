module Api
  module Exceptions
    class ClientError < StandardError
      def initialize(response)
        msg = "#{PREFIX}: #{response.status} Client side Error. Ergast F1 Api says: #{response.body}"
      super(msg)
    end

    class ServerError < StandardError
      def initialize(response)
        msg = "#{PREFIX}: #{response.status} Server side Error. Ergast F1 Api says: #{response.body}"
      super(msg)
    end

    class UnknownError < StandardError
      def initialize(response)
        msg = "#{PREFIX}: #{response.status} Unknown Error. Ergast F1 Api says: #{response.body}"
      super(msg)
    end
  end
end
