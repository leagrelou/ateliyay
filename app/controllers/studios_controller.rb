class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :create]

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
  end

  def show
    @studio = Studio.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:name)
  end
end
