require 'ergast_f1_api/models/driver'

module ErgastF1Api
  module Api
    class Driver
      def initialize(client:)
        @client = client
      end

      def all
        get('drivers.json?limit=1000')
      end

      def by_id(id:)
        get("drivers/#{id}.json")
      end

      def by_season(season: 'current')
        get("#{season}/drivers.json?limit=50")
      end

      def by_team(team:, season: 'all')
        return get("#{season}/constructors/#{team}/drivers.json") unless season == 'all'
        get("constructors/#{team}/drivers.json?limit=500")
      end

      private

      def get(url)
        build_driver(@client.get(url: url))
      end

      def build_driver(response)
        JSON.parse(response.body)['MRData']['DriverTable']['Drivers'].map do |metadata|
          ErgastF1Api::Models::Driver.new(metadata)
        end
      end
    end
  end
end