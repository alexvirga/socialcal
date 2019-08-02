class GroupsController < ApplicationController
  before_action :authorized?
  skip_before_action :authorized?, only: [:new, :create]

  def index
    if session[:user_id]
      @groups = Group.all
    else redirect_to "/login"     end
  end

  def new
    @group = Group.new
  end

  def create
    @user = session[:user_id]
    @group = Group.new(group_params)
    if @group.valid?
      @group.save
      UserGroup.create(user_id: @user, group_id: @group.id, leader: true)
      redirect_to @group
    else
      flash.now[:messages] = @group.errors.full_messages[0]
      render "new"
    end
  end

  def show
    if session[:user_id]
      @group = Group.find(params[:id])
      @user = User.find(session[:user_id])
    else
      redirect_to "/login"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      redirect_to @group
    else
      flash.now[:messages] = @group.errors.full_messages[0]
      render "edit"
    end
  end

  def add_message
    @new_message = Message.create(user_id: session[:user_id], group_id: params[:id], content: params[:Message])
    redirect_to group_path(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def message_params
    params.require(:id_name).permit(:variable)
  end
end
