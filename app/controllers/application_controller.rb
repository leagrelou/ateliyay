class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_num_pending_bookings_for_current_user

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end


  # for displaying user notifications
  def get_num_pending_bookings_for_current_user
    if user_signed_in?
      # this is messy...
      if current_user.studios.size > 0 &&
        current_user.studios.select{|s| s.bookings.size > 0 }.size > 0

        # get current user's studios
        my_studios = current_user.studios

        # find studios with bookings
        my_studios_with_bookings = my_studios.select{|s| s.bookings.size > 0 }

        # make array with number of pending bookings for each studio
        pending_cnt_array = my_studios_with_bookings.map {|s| s.bookings.where(bookings: {confirmed: false}).size}

        # sum all the numbers in the array
        @pending_booking_count = pending_cnt_array.reduce(:+)
        else
        # set to 0 by default
        @pending_booking_count = 0
      end
    end
  end

end
