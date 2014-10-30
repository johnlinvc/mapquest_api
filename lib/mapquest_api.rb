require "mapquest_api/version"
require 'dotenv'
require 'rest_client'
require 'oj'
Dotenv.load

module MapquestApi
  def self.api_key
    ENV['MAPQUEST_API_KEY']
  end
  def self.route_matrix(locations)
    RouteMatrix.new(locations).run
  end
  class RouteMatrix < Struct.new(:locations)
    def run
      locations_json = locations.map{|l| { :latLng => { :lat => l.lat, :lng => l.lng} } }
      body = {
        :locations => locations_json,
        :options => { :allToAll => true, :unit => "k" }
      }
      response = RestClient.post "http://open.mapquestapi.com/directions/v2/routematrix?key=#{MapquestApi.api_key}", body.to_json, :content_type => :json, :accept => :json
      response_json = Oj.load(response)
      {time: response_json["time"], distance: response_json["distance"]}
    end
  end
end
