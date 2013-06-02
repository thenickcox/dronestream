module Dronestream
  class Strike
    include HTTParty
    base_uri 'http://api.dronestre.am'
    
    def self.response
      response = get '/data'
    end

    def self.all
      response['strike']
    end

    def self.country(country)
      self.all.keep_if { |strike| strike['country'] == country }
    end

    def self.with_civilian_casualties
      self.all.reject { |strike| strike['civilians'].to_i == 0 }
    end

  end
end
