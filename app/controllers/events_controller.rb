class EventsController < ApplicationController
  before_action :authorized?
  skip_before_action :authorized?, only: [:new, :create]

  def index
  end

  def new
    @event = Event.new
  end

  def create
    @user = session[:user_id]
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      UserEvent.create(user_id: @user, event_id: @event.id, :host => true)
      redirect_to user_path(@user)
    else
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
