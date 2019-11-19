class MyStudiosController < ApplicationController
  def index
    user = current_user
    @my_studios = user.studios
  end

  def new
    user = current_user
    @my_studio = Studio.new
    @my_studio.user = user
  end

  def create
    user = current_user
    @my_studio = Studio.new(params_my_studio)
    @my_studio.user = user
    if @my_studio.save
      redirect_to my_studios_path
    else
      render :new
    end
  end

  def edit
    user = current_user
    @my_studio = Studio.find(user.studios.id = params[:id])
  end

  def update
    user = current_user
    @my_studio = Studio.find(user.studios.id = params[:id])
    @my_studio.update(params_my_studio)
  end

  def destroy
    user = current_user
    @my_studio = Studio.find(user.studios.id = params[:id])
    @my_studio.destroy
    redirect_to my_studios_path
  end

  def show
    user = current_user
    @my_studio = Studio.find(user.studios.id = params[:id])
  end

  private

  def params_my_studio
    params.require(:studio).permit(:name, :category, :price_per_hour, :city, :description)
  end
end
