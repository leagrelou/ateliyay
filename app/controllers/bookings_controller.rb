class BookingsController < ApplicationController
  # set @studio before each action specified
  before_action :set_studio, only: [:new, :create]
  before_action :set_booking, only: [:show, :update]

  def index
    # not sure if this works... return renter bookings for current user
    @bookings = Booking.where(user: current_user)
  end


  # GET  /bookings/:id, alias: booking
  def show
    @studio = @booking.studio
    @confirmation_status = @booking.confirmed ? "confirmed" : "pending"
    # raise
    # calculate elapsed time in hours
    @booking_time = (@booking.end_datetime - @booking.start_datetime).abs / 60 / 60

    # calculate price
    @booking_price = @studio.price_per_hour * @booking_time

  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.studio = @studio
    @booking.user = current_user
    @booking.save

    if @booking.save
     redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
    @booking.update(confirmed_booking_params)

    redirect_to my_studios_path
  end


  private

  def set_studio
    @studio = Studio.find(params[:studio_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  # renter can request dates
  def booking_params
    params.require(:booking).permit(:start_datetime, :end_datetime)
  end

  # host can confirm, not change dates
  def confirmed_booking_params
    params.require(:booking).permit(:confirmed)
  end
end
