require 'mapquest_api'

describe MapquestApi do
  describe ".api_key" do
    it "should be able to read MAPQUEST_API_KEY from ENV" do
      api_key = "this_is_an_api_key"
      expect(MapquestApi.api_key).not_to be_nil
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
    it "should return an array of array" do
      #expect(true).to eq false
    end
  end
end
