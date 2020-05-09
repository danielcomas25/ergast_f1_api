require 'ergast_f1_api/models/constructor'

module ErgastF1Api
  module Api
    # Driver consumer
    class Constructor
      def initialize(client:)
        @client = client
      end

      def all
        get('constructors.json?limit=1000')
      end

      def current
        get('current/constructors.json?limit=30')
      end

      def by_id(id:)
        get("constructors/#{id}.json")
      end

      def by_nationality(nationality:)
        all.select { |constructor| constructor.nationality == nationality.capitalize }
      end

      def by_season(season: 'current')
        get("#{season}/constructors.json?limit=30")
      end

      private

      def get(url)
        build_constructor(@client.get(url: url))
      end

      def build_constructor(response)
        JSON.parse(response.body)['MRData']['ConstructorTable']['Constructors'].map do |metadata|
          ErgastF1Api::Models::Constructor.build(metadata)
        end.compact
      end
    end
  end
end
