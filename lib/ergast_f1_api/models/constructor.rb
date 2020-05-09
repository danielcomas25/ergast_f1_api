module ErgastF1Api
  module Models
    # Constructor model
    class Constructor
      attr_reader :nationality, :id

      def initialize(params)
        @id = params['constructorId']
        @url = params['url']
        @name = params['name']
        @nationality = params['nationality']
      end

      class << self
        def build(params)
          return unless params.class == Hash
          Constructor.new(params)
        end
      end
    end
  end
end
