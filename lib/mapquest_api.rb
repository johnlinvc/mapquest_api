require "mapquest_api/version"
require 'dotenv'
Dotenv.load

module MapquestApi
  def self.api_key
    ENV['MAPQUEST_API_KEY']
  end
  class RouteMatrix < Struct.new(:locations)
    def run
      response = RestClient.post "http://open.mapquestapi.com/directions/v2/routematrix?key=#{MapquestApi.api_key}", str, :content_type => :json, :accept => :json
    end
  end
end
