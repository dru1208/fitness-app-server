require 'google_places'
require 'geocoder'


class GymMapsController < ApplicationController

  def index
    @client = GooglePlaces::Client.new('AIzaSyDJ27_9A1XNoXhVa8X5QnyHRD59-CF42I4')
    maps = @client.spots(43.644758, -79.395274, :types => ['gym', 'health'], :exclude => 'store')

    render json: maps



  end
end
