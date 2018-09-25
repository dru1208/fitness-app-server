require 'geocoder'

class EventMapsController < ApplicationController
  def index
    locations = Event.all.pluck(:location)
    resultsArray = []

    locations.each do |point|
      result = Geocoder.search(point)
      resultsArray.push(result.first.coordinates)
    end
    render json: resultsArray
  end

end
