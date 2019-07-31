class EventsController < ApplicationController
  before_action :authorized?
  skip_before_action :authorized?, only: [:new, :create]

  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      redirect_to @event
    else
      flash.now[:messages] = @user.errors.full_messages[0]
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def event_params
    params.require(:event).permit(:title, :location, :description, :host, :start_time, :end_time)
  end
end
