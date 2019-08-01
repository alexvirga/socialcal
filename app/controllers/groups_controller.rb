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
      UserGroup.create(user_id: @user, group_id: @group.id)
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
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
