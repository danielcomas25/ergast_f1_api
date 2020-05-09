module ErgastF1Api
  module Models
    # Standing list model
    class Standings
      attr_reader :season, :round

      def initialize(params)
        @season = params['season']
        @round = params['round']
      end
    end
  end
end
