class PlacesController < ApplicationController
  before_action :set_place, only: [:show,:edit,:update,:destroy]
  #before_action :authenticate_owner! , except: [:index,:show]

  def index
    @places = Place.all
  end

  def show
  end

  def new
    @place = Place.new
    load_categories
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
    load_categories
  end

  def update

    if @place.update(place_params)
      redirect_to @place, notice: 'Place was successfuly updated'
    else
      render 'edit'
      load_categories
    end

  end

  def destroy
    @place.destroy
    redirect_to places_path
  end

  private
  def set_place
    @place = Place.find(params[:id])
  end
  def load_categories
    @categories = Category.all.map {|c| [c.title,c.id]}
  end
  def place_params
    params.require(:place).permit(:name,:address,:phone_number,:established_at,:contact_mail,:city,:description)
  end
end
