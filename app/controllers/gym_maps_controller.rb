require 'google_places'
require 'geocoder'


class GymMapsController < ApplicationController

  def index

    current_location = User.all.pluck(:location)
    puts current_location


    centerLat = Geocoder.search(current_location[0]).first.data["lat"].to_f
    centerLng = Geocoder.search(current_location[0]).first.data["lon"].to_f

     puts centerLat
     puts centerLng
     puts Geocoder.search(current_location[0])
     puts Geocoder.search(current_location[0]).first
     puts Geocoder.search(current_location[0]).first.data


    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_API_TOKEN'])
    maps = @client.spots(centerLat, centerLng, :types => ['gym', 'health'], :radius => 5000, :exclude => 'store')

    render json: maps


  end
end
