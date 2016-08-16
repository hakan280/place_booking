class ReservationsController < ApplicationController
  def create
      @reservation = Reservation.new(reservation_params)
      redirect_to places_path(place_id: params[:place_id]), notice: "Your reservation succesfully"
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
