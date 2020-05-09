require 'ergast_f1_api/models/location'

module ErgastF1Api
  module Models
    # Circuit model
    class Circuit
      attr_reader :id, :name, :location

      def initialize(params)
        @id = params['circuitId']
        @name = params['circuitName']
        @location = Location.build(params['Location'])
      end

      class << self
        def build(params)
          return unless params.class == Hash
          Circuit.new(params)
        end
      end
    end
  end
end
