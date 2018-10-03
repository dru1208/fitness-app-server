class EventsController < ApplicationController

  def create
    @event = Event.new(name: params[:name], description: params[:description], location: params[:location], datetime: params[:datetime], user_id: params[:id])
    if @event.save
      @events = Event.all.select(:id, :name, :description, :location, :datetime, :user_id)
      render json: @events
    else
      render json: false
    end

  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      @events = Event.all.select(:id, :name, :description, :location, :datetime, :user_id)
      render json: @events
    else
      render json: false
    end
  end

  def index
    events = Event.all.select(:id, :name, :description, :location, :datetime, :user_id)
    render json: events
  end
end
