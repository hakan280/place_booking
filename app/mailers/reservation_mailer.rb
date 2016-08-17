class ReservationMailer < ApplicationMailer
  def new_reservation (res)
    @res = res
    mail(to: @res.customer.email, subject: 'Your Reservation Information')
  end
end
