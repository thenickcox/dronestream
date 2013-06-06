module Dronestream
  class Strike
    include HTTParty
    base_uri 'http://api.dronestre.am'
    
    class << self

      def response
        response = get '/data'
      end

      def strike
        @strike || all
      end

      def all
        response['strike']
      end

      def in_country(country)
        strike.keep_if { |strike| strike['country'] == country }
        self
      end

      def with_civilian_casualties
        strike.keep_if { |strike| strike['civilians'].to_i != 0 }
        self
      end

      def with_child_casualties
        strike.keep_if { |strike| !strike['children'].to_i.zero? }
        self
      end

      def in_town(town)
        strike.keep_if { |strike| strike['town'] == town }
        self
      end

      def with_injuries
        strike.keep_if { |strike| strike['injuries'].length != 0 }
        self
      end

      def in_location(location)
        strike.keep_if { |strike| strike['location'] == location }
        self
      end

      def with_min_deaths(integer)
        strike.keep_if { |strike| strike['deaths_min'].to_i >= integer }
        self
      end

      def with_max_deaths(integer)
        strike.keep_if { |strike| strike['deaths_max'].to_i <= integer }
        self
      end

      def with_intended_target
        strike.keep_if { |strike| strike['target'].length != 0 }
        self
      end

      def method_missing(name)
        strike.send(name.to_sym) if strike.respond_to?(name)
      end
    end

  end
end
