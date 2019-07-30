class GroupsController < ApplicationController
  before_action :authorized?
  skip_before_action :authorized?, only: [:new, :create]

  def index
   if session[:user_id]
    @groups = Group.all 
   else redirect_to "/login"
  end
end 

  def new
    @group = Group.new 
  end

  def show
    if session[:user_id]
    @group = Group.find(params[:id])
    else 
      redirect_to "/login"
end
end 

  def edit
  end
  
end
