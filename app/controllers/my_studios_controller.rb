class MyStudiosController < ApplicationController
  def index
    user = current_user
    @my_studios = user.studios
  end

  def new
    user = current_user
    @my_studio = Studio.new(user)
  end

  def create
    user = current_user
    @my_studio = Studio.new(user)
    if @my_studio.save
      redirect_to my_studios_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end
end
