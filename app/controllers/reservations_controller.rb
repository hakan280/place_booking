class ReservationsController < ApplicationController
  before_action :authenticate_customer! , only: [:create]
  def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
          redirect_to place_path(id: params[:place_id]), notice: "Your reservation succesfully"
        end
  end
  def show
  end

  def index
    @reservations = Reservation.where(place_id: params[:place_id])
  end


  private

  def reservation_params
    params.require(:reservation).permit(:date,:number_of_people).merge(customer_id: current_customer.id, place_id: params[:place_id])
  end
end
