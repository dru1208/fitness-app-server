class EventsController < ApplicationController
  def index
    events = Event.all.select(:name, :description, :location, :datetime)
    render json: events
  end
end
