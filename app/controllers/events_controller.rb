class EventsController < ApplicationController
  def create
    @event = Event.create(name: params[:name], description: params[:description], location: params[:location],datetime: params[:datetime], user_id: 1)
  end

  # def destroy
  #   @goal = Event.find(id: params[:id])
  # end

  def index
    events = Event.all.select(:name, :description, :location, :datetime)
    render json: events
  end
end
