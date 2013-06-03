module Dronestream
  class Strike
    include HTTParty
    base_uri 'http://api.dronestre.am'
    
    class << self

      def response
        response = get '/data'
      end

      def all
        response['strike']
      end

      def in_country(country)
        all.keep_if { |strike| strike['country'] == country }
      end

      def with_civilian_casualties
        all.keep_if { |strike| strike['civilians'].to_i != 0 }
      end

      def with_child_casualties
        all.keep_if { |strike| strike['children'].length != 0 }
      end

      def in_town(town)
        all.keep_if { |strike| strike['town'] == town }
      end

      def with_injuries
        all.keep_if { |strike| strike['injuries'].length != 0 }
      end

      def in_location(location)
        all.keep_if { |strike| strike['location'] == location }
      end

      def with_min_deaths(integer)
        all.keep_if { |strike| strike['deaths_min'].to_i >= integer }
      end

      def with_max_deaths(integer)
        all.keep_if { |strike| strike['deaths_max'].to_i <= integer }
      end

      def with_intended_target
        all.keep_if { |strike| strike['target'].length != 0 }
      end
    end

  end
end
