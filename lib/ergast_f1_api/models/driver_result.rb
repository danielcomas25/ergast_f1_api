require 'ergast_f1_api/models/driver'
require 'ergast_f1_api/models/result'

module ErgastF1Api
  module Models
    # Driver Result model
    class DriverResult < Result
      attr_reader :driver

      def initialize(params)
        super()
        @driver = Driver.build(params['Driver'])
      end

      class << self
        def build(params)
          return unless params.class == Hash
          DriverResult.new(params)
        end
      end
    end
  end
end
