class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :create]

  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
  end
end
