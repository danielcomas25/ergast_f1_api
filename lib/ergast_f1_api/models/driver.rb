module ErgastF1Api
  module Models
    class Driver
      def initialize(params)
        @driver_id = params['driverId']
        @permanent_number = params['permanentNumber']
        @code = params['code']
        @url = params['url']
        @first_name = params['givenName']
        @last_name = params['familyName']
        @bith_date = params['dateOfBirth']
        @nationality = params['nationality']
      end

      class << self
        def build(params)
          return unless params.class == 'Hash'
          ErgastF1Api::Models::Driver.new(params)
        end
      end
    end
  end
end
