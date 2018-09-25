require 'geocoder'

class MapsController < ApplicationController
  def index
    locations = Event.all.select(:location)
    resultsArray = []
     locations.each do |point|
       result = Geocoder.search(point.location)
       resultsArray.push(result.first.coordinates)
     end
    render json: resultsArray
  end

end
