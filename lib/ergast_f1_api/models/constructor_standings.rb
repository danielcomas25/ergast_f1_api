require 'ergast_f1_api/models/standings'
require 'ergast_f1_api/models/constructor_result'

module ErgastF1Api
  module Models
    # Constructor Standings list model
    class ConstructorStandings < Standings
      attr_reader :driver_results

      def initialize(params)
        super()
        @driver_results = params['StandingsLists']['ConstructorStandings'].map do |result_params|
          ConstructorResult.build(result_params)
        end
      end

      class << self
        def build(params)
          return unless params.class == Hash
          ConstructorStandings.new(params)
        end
      end
    end
  end
end
