require 'geocoder'

class EventMapsController < ApplicationController
  def index
    coordinates = Event.all.pluck(:location)
    coordinatesArray = []


    coordinates.each do |point|
      result = Geocoder.search(point)
      coordinatesArray.push(result.first.coordinates)
    end
    render json: coordinatesArray
  end

end
