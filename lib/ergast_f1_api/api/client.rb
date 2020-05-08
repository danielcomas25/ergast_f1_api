require 'faraday'

module ErgastF1Api
  module Api
    # Client for the api
    class Client
      HOST = 'https://ergast.com/api/f1/'.freeze

      def initialize(url = HOST)
        @connection = Faraday.new(url: url) do |builder|
          builder.request :multipart
          builder.request :url_encoded
          builder.adapter :net_http
          builder.options.timeout = 1900
          # builder.response :logger , Faraday::Logger.new(STDOUT), bodies: true
        end
      end

      def get(params)
        response = @connection.get do |req|
          req.url params[:url]
          req.headers['Content-Type'] = 'application/json'
        end
        error_handler(response.to_hash) unless response.status.to_i.between?(200, 299)
        response
      end

      private

      def error_handler(response)
        case response[:status].to_i
        when 400..499
          raise ErgastF1Api::Api::Exceptions::ClientError, response
        when 500..599
          raise ErgastF1Api::Api::Exceptions::ServerError, response
        else
          raise ErgastF1Api::Api::Exceptions::UnknownError, response
        end
      end
    end
  end
end
