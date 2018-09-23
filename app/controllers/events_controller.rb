class EventsController < ApplicationController
  def index
    events = Event.all.select(:name, :description)
    render json: events
  end
end
