require 'geocoder'

class EventMapsController < ApplicationController
  def index
    locations = Event.all.pluck(:location, :name, :description, :datetime)

    # puts Geocoder.search(locations[0][0]).first.data["lat"]

    @resultsArray = locations.map do |point|
      loc = Geocoder.search(point[0]).first.data
      {
        location: point[0],
        name: point[1],
        description: point[2],
        datetime: point[3],
        lat: loc["lat"],
        lng: loc["lon"]
      }
    end


    render json: @resultsArray
  end


end

