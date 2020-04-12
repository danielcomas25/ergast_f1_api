require 'faraday'

module ErgastF1Api
  module Api
    class Client
      HOST = 'https://ergast.com/api/f1/'

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
        error_handler(response) unless response.status.to_i.between?(200, 299)
        response
      end

      def error_handler(response)
        # All response status from the server 200 is considered SUCCESS
        case response.status.to_i
        when 400..499
          raise EgarstF1Api::ClientError, response
        when 500..599
          raise EgarstF1Api::ServerError, response
        else
          raise EgarstF1Api::UnknownError, response
        end
      end
    end
  end
end
