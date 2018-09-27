require 'google_places'
require 'geocoder'


class GymMapsController < ApplicationController
  def self.generate_jwt(payload)
    super(payload)
  end

  def self.decode_jwt (jwt)
    super(jwt)
  end

  def index


    jwt = request.headers["HTTP_AUTHORIZATION"]
    decoded_jwt = GymMapsController.decode_jwt(jwt)
    location = decoded_jwt[0]["location"]


    # puts Geocoder.search(location[0]).first.data["lat"]
    centerLat = Geocoder.search(location[0]).first.data["lat"]
    centerLng = Geocoder.search(location[0]).first.data["lon"]


    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_API_TOKEN'])
    maps = @client.spots(centerLat.to_f, centerLng.to_f, :types => ['gym', 'health'], :exclude => 'store')
    puts "hello1"

    puts maps

     render json: maps




  end
end
