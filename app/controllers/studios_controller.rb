class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # binding.pry
    if params[:search]

      # binding.pry
      studio_name = search_params["name"]
      sql_query = "name ILIKE :studio_name"
      @studios = Studio.where(sql_query, studio_name: "%#{studio_name}%")
    else
      @studios = Studio.all
    end

    # @studios = @studios.geocoded #returns flats with coordinates
    @markers = @studios.map do |studio|
      {
        lat: studio.latitude,
        lng: studio.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { studio: studio }),
        image_url: helpers.asset_url(studio.photo.to_s)
      }
    end

  end

  def show
    @studio = Studio.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:name)
  end
end
