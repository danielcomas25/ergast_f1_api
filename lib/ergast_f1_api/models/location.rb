module ErgastF1Api
  module Models
    # Location model
    class Location
      attr_reader :lat, :long, :locality, :country

      def initialize(params)
        @lat = params['lat']
        @long = params['long']
        @locality = params['locality']
        @country = params['country']
      end

      class << self
        def build(params)
          return unless params.class == Hash
          Location.new(params)
        end
      end
    end
  end
end
