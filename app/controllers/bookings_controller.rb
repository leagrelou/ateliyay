class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @studio = set_studio
  end

  def create
    @booking = Booking.new(booking_params)
    @studio = set_studio
    @booking.studio = @studio
    @booking.user = current_user
    @booking.save

    redirect_to booking_path(@booking)
  end

  def show
  end

  private

  def set_studio
    Studio.find(params[:studio_id])
  end

  def booking_params
    params.require(:booking).permit(:start_datetime, :end_datetime)
  end
end
