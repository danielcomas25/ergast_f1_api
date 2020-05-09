require 'ergast_f1_api/models/standings'

module ErgastF1Api
  module Models
    # Driver Standings list model
    class DriverStandings < Standings
      attr_reader :driver_results

      def initialize(params)
        super()
        @driver_results = params['StandingsLists']['DriverStandings'].map do |result_params|
          DriverResult.build(result_params)
        end
      end

      class << self
        def build(params)
          return unless params.class == Hash
          DriverStandings.new(params)
        end
      end
    end
  end
end
