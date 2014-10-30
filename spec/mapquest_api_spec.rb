require 'mapquest_api'
require 'hashie'
require 'byebug'

describe MapquestApi do
  describe ".api_key" do
    it "should be able to read MAPQUEST_API_KEY from ENV" do
      api_key = "this_is_an_api_key"
      expect(MapquestApi.api_key).not_to be_nil
    end
  end

  describe ".route_matrix" do
    let(:locations) do
      [
        {lat: 37.862544,lng: -122.293426},
        {lat: 37.863510,lng: -122.285258},
        {lat: 37.868888,lng: -122.295444},
        {lat: 37.866666,lng: -122.285555}
      ].map{|l| Hashie::Mash.new(l)}
    end

    it "should be return the result of run on the created RouteMatrix" do
      expect(MapquestApi.route_matrix(locations)).to eq MapquestApi::RouteMatrix.new(locations).run
    end

  end
end

describe MapquestApi::RouteMatrix do

  describe ".new" do
    it "should return an object" do
      expect(MapquestApi::RouteMatrix.new(nil)).not_to be_nil
    end
  end

  describe "#run" do
    let(:locations) do
      [
        {lat: 37.862544,lng: -122.293426},
        {lat: 37.863510,lng: -122.285258},
        {lat: 37.868888,lng: -122.295444},
        {lat: 37.866666,lng: -122.285555}
      ].map{|l| Hashie::Mash.new(l)}
    end
    it "should return an hash with :time key" do
      result = MapquestApi::RouteMatrix.new(locations).run
      expect(result[:time]).not_to be_nil
    end
    it "should return an hash with :distance key" do
      result = MapquestApi::RouteMatrix.new(locations).run
      expect(result[:distance]).not_to be_nil
    end
  end

end
