class UsergroupsController < ApplicationController

  
  def new
    @usergroup = UserGroup.new
    @user = session[:user_id]
    @groups = Group.all
  end

  def create
    @usergroup = UserGroup.new(usergroup_params)
    if @usergroup.valid?
      @usergroup.save
      redirect_to @user
    else
      flash.now[:messages] = @user_group.errors.full_messages[0]
      render "new"
    end
  end

  def show
  end

  def usergroup_params
    params.require(:usergroup).permit(:user_id, :group_id)
  end

  def edit
  end
end
