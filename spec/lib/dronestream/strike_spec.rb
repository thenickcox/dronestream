require_relative '../../test_helper'

describe Dronestream::Strike do

  let(:strike) { Dronestream::Strike }

  before do
    VCR.insert_cassette 'strike', :record => :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  let(:uri) { 'http://api.dronestre.am' }

  it 'should have the right base uri' do
    expect(Dronestream::Strike.base_uri).to eq(uri)
  end

  describe '#response' do
    context 'no error' do
      pending 'no error'
    end
    context 'error' do
      pending 'error'
    end
  end

  describe '#all' do
    it 'parses the api response from json to array' do
      expect(strike.all).to be_instance_of Array
    end
  end

  describe '#country' do
    let(:country_name) { 'Yemen' }
    it 'takes a country and returns strikes from that country' do
      expect(strike.in_country(country_name).first['country']).to eq(country_name)
    end
  end

  describe '#with_civilian_casualties' do
    it 'returns an array of strikes with civilian casualties' do
      expect(strike.with_civilian_casualties.first['civilians']).not_to eq('0')
    end
  end

  describe '#with_child_casualties' do
    it 'returns an array of strikes with child casualties' do
      expect(strike.with_child_casualties.first['children']).not_to eq('')
    end
  end

  describe '#in_town' do
    let(:town_name) { 'Wadi Abida' }
    it 'returns an array of strikes for a given town' do
      expect(strike.in_town(town_name).first['town']).to eq(town_name)
    end
  end

  describe '#in_location' do
    let(:location_name) { 'North Waziristan' }
    it 'returns an array of strikes for a given location' do
      expect(strike.in_location(location_name).first['location']).to eq(location_name)
    end
  end

  describe '#with_injuries' do
    it 'returns an array of strikes with injuries' do
      expect(strike.with_injuries.first['injuries']).not_to be_empty
    end
  end

  describe '#with_min_deaths' do
    let(:integer) { 4 }
    it 'returns an array of strikes with a minimum given number of deaths' do
      expect(strike.with_min_deaths(integer).first['deaths_min'].to_i).to be >= integer 
    end
  end

  describe '#with_max_deaths' do
    let(:integer) { 4 }
    it 'returns an array of strikes with a minimum given number of deaths' do
      expect(strike.with_max_deaths(integer).first['deaths_max'].to_i).to be <= integer 
    end
  end

  describe '#with_intended_target' do
    it 'returns an array of strikes that actually have an intended target' do
      expect(strike.with_intended_target.first['target'].length).not_to be_zero
    end
  end

  context 'chaining' do
    let(:new_str) { Dronestream::Strike.in_country('Yemen').with_civilian_casualties.first }
    it 'does not blow up' do
      expect(new_str['country']).to eq('Yemen')
      expect(new_str['civilians']).not_to eq(0)
    end
  end
end

