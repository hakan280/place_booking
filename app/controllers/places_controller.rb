class PlacesController < ApplicationController
  before_action :set_place, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_owner! , except: [:index,:show]

  def index
    @places = Place.all
  end

  def show
    @comments = @place.comments
  end

  def new
    @place = Place.new
    load_form_data
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to @place
    else
      load_form_data
      render 'new'
    end

  end

  def edit
    load_form_data
  end

  def update

    if @place.update(place_params)
      redirect_to @place, notice: 'Place was successfuly updated'
    else
      render 'edit'
      load_form_data
    end

  end

  def authorize_owner!
    redirect_to @place, notice: "Not authorized" unless @place.owner_id == current_owner.id
  end

  def destroy
    @place.destroy
    redirect_to places_path
  end

  private
  def set_place
    @place = Place.find(params[:id])
  end
  def load_form_data
    @categories = Category.all.map {|c| [c.name,c.id]}
    @place.build_social_profile
  end
  def place_params
    params.require(:place).permit(:name,:address,:phone_number,:established_at,:contact_mail,:city,:description,:category_id,
                                  social_profile_attributes: [:id, :facebook, :twitter, :instagram, :foursquare]).merge(owner_id: current_owner.id)
  end
end
