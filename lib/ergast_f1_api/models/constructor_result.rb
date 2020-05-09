require 'ergast_f1_api/models/constructor'

module ErgastF1Api
  module Models
    # Constructor Result model
    class ConstructorResult
      attr_reader :constructor

      def initialize(params)
        super()
        @constructor = Constructor.build(params['Constructor'])
      end

      class << self
        def build(params)
          return unless params.class == Hash
          ConstructorResult.new(params)
        end
      end
    end
  end
end
