require 'ergast_f1_api/models/circuit'

module ErgastF1Api
  module Api
    # Driver consumer
    class Circuit
      def initialize(client:)
        @client = client
      end

      def all
        get('circuits.json?limit=1000')
      end

      def current
        get('current/circuits.json?limit=30')
      end

      def by_id(id:)
        get("circuits/#{id}.json")
      end

      def by_country(country:)
        all.select { |circuit| circuit.location.country == country.capitalize }
      end

      def by_season(season: 'current')
        get("#{season}/circuits.json?limit=30")
      end

      def by_locality(locality:)
        all.select { |circuit| circuit.location.locality == locality.capitalize }
      end

      private

      def get(url)
        build_circuit(@client.get(url: url))
      end

      def build_circuit(response)
        JSON.parse(response.body)['MRData']['CircuitTable']['Circuits'].map do |metadata|
          ErgastF1Api::Models::Circuit.build(metadata)
        end.compact
      end
    end
  end
end
