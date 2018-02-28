class HomeController < ApplicationController
  require 'google_maps_service'

  def index
    GoogleMapsService.configure do |config|
  config.key = ENV["MAPS"]
  config.retry_timeout = 20
  config.queries_per_second = 10
  gmaps = GoogleMapsService::Client.new
  results = gmaps.geocode('1600 Amphitheatre Parkway, Mountain View, CA')
   @longitude = results[0][:geometry][:location][:lng]
   @latitude = results[0][:geometry][:location][:lat]
  #gmaps.directions
  #gmaps.geocode
  #  @routes = gmaps.directions(
  #   '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA',
  #   '2400 Amphitheatre Parkway, Mountain View, CA 94043, USA',
  #   mode: 'walking',
  #   alternatives: false)
  end
end


end
