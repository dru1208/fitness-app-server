class EventsController < ApplicationController

  def create
    @event = Event.new(name: params[:name], description: params[:description], location: params[:location], datetime: params[:datetime], user_id: params[:id])
    if @event.save
      puts 'saved'
      @events = Event.all.select(:id, :name, :description, :location, :datetime)
      render json: @events
    end

  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      @events = Event.all.select(:id, :name, :description, :location, :datetime)
      render json: @events
    else
      render json: false
    end
  end

  def index
    events = Event.all.select(:id, :name, :description, :location, :datetime)
    render json: events
  end
end
