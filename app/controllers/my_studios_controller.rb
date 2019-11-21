class MyStudiosController < ApplicationController
  def index
    user = current_user
    @my_studios = user.studios

    # get all bookings associated with logged in owner
    @my_bookings = Booking.joins(:studio).where(studios: { user: user })

    # get arrays of confirmed and unconfirmed bookings for logged in owner
    @pending_bookings = @my_bookings.select { |b| !b.confirmed }
    @confirmed_bookings = @my_bookings.select { |b| b.confirmed }
  end

  def new
    @my_studio = Studio.new
  end

  def create
    user = current_user
    @my_studio = Studio.new(params_my_studio)
    @my_studio.geocode
    @my_studio.user = user
    if @my_studio.save
      redirect_to my_studios_path
    else
      render :new
    end
  end

  def edit
    user = current_user
    @my_studio = Studio.find(params[:id])
  end

  def update
    user = current_user
    @my_studio = Studio.find(params[:id])
    if @my_studio.update(params_my_studio)
      redirect_to my_studio_path(@my_studio)
    else
      render :edit
    end
  end

  def destroy
    user = current_user
    @my_studio = Studio.find(params[:id])
    @my_studio.destroy
    redirect_to my_studios_path
  end

  def show
    user = current_user
    @my_studio = Studio.find(params[:id])
  end

  private

  def params_my_studio
    params.require(:studio).permit(:name, :category, :price_per_hour, :city, :description, :address, :photo)
  end

end
