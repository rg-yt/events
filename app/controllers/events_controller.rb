class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = current_user.events.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.expect(event: [ :location, :date, :time ])
  end
end
