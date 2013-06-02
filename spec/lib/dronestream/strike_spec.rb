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

  describe '#all' do
    it 'parses the api response from json to array' do
      expect(strike.all).to be_instance_of Array
    end
  end

  describe '#country' do
    it 'takes a country and returns strikes from that country' do
      expect(strike.country('Yemen').first['country']).to eq('Yemen')
    end
  end

  describe '#with_civilian_casualties' do
    it 'returns an array of strikes with civilian casualties' do
      expect(strike.with_civilian_casualties.first['civilians']).not_to eq('0')
    end
  end
end

