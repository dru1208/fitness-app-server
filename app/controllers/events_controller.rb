class EventsController < ApplicationController

  def create
    @event = Event.create(name: params[:name], description: params[:description], location: params[:location],datetime: params[:datetime], user_id: params[:id])
    if @event.save
      render json: @event
    end
  end

  def destroy
    @event = Event.find(params[:id]).destroy
    redirect_to root_url
  end

  def index
    events = Event.all.select(:name, :description, :location, :datetime)
    render json: events
  end
end
