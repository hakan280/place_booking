class PlacesController < ApplicationController
  before_action :set_place, only: [:show,:edit,:update,:destroy]
  def index
    @places = Place.all
  end

  def show
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to @place
    else
      render 'new'
    end

  end

  def edit

  end

  def update

  end

  def destroy
  end

  private
  def place_params
    params.require(:place).permit(:name,:address,:phone_number,:established_at,:contact_mail,:city,:description)
  end
end
