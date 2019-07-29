class UsersController < ApplicationController
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
    @UserGroup = UserGroup.new 
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def login
    @users = User.find(params[:id])
  end

  def index
    @users = User.all
  end



  def user_params
    params.require(:user).permit(:name, :age, :bio, :password)
  end 

end
