require 'ergast_f1_api/models/driver_standings'

module ErgastF1Api
  module Api
    # Driver Standings consumer
    class DriverStandings
      def initialize(client:)
        @client = client
      end

      def current
        get('current/driverStandings.json')
      end

      def by_year(year:)
        get("#{year}/driverStandings.json")
      end

      def by_round(round:, year: 'current')
        get("#{year}/#{round}/driverStandings.json")
      end

      private

      def get(url)
        build_driver_standings(@client.get(url: url))
      end

      def build_driver_standings(response)
        JSON.parse(response.body)['MRData']['StandingsTable']['StandingsLists'].map do |metadata|
          ErgastF1Api::Models::DriverStandings.build(metadata)
        end.compact
      end
    end
  end
end
