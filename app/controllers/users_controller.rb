class UsersController < ApplicationController
  before_action :authorized?
  skip_before_action :authorized?, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:message] = @user.errors.full_messages[0]
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @groups = Group.all
    @events = Event.all
    @userevents = UserEvent.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      flash.now[:messages] = @user.errors.full_messages[0]
      render "edit"
    end
  end

  def login
    @users = User.find(params[:id])
  end

  def joingroup
    @user = User.find(params[:id])
    @groups = Group.all
  end

  def joingroup_create
    @user = User.find(session[:user_id])
    UserGroup.create(user_id: @user.id, group_id: params[:user_group][:group_id])
    redirect_to user_path(@user)
  end

  def user_params
    params.require(:user).permit(:name, :age, :bio, :password)
  end

  # def usergroup_params
  #   params.require(:user_groups).permit(:group_id, :user_id)
  # end
end
