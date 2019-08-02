class EventsController < ApplicationController
  before_action :authorized?
  skip_before_action :authorized?, only: [:new, :create]

  def index
    @user = session[:user_id]
    @events = Event.all
    @groups = Group.all
  end

  def new
    @event = Event.new
  end

  def create
    @user = session[:user_id]
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      UserEvent.create(user_id: @user, event_id: @event.id, host: true)
      redirect_to @event
    else
      flash.now[:messages] = @user.errors.full_messages[0]
      render "new"
    end
  end

  def show
    @user = session[:user_id]
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to @event
    else
      flash.now[:messages] = @event.errors.full_messages[0]
      render "edit"
    end
  end

  def event_params
    params.require(:event).permit(:title, :location, :description, :host, :start_time, :end_time)
  end
end
