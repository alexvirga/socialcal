class GroupsController < ApplicationController
  def index

  end

  def new
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
  end
end
