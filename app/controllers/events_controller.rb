class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = current_user.events.all
  end
  
  def show
    @event = Event.find(params[:id])
  end
end
