
module ErgastF1Api
  module Models
    # Driver Result model
    class Result
      attr_reader :position, :points, :wins

      def initialize(params)
        @position = params['position']
        @points = params['points']
        @wins = params['wins']
      end
    end
  end
end
