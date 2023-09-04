class PassengerMailer < ApplicationMailer
  def confirmation_email(passenger)
    @passenger = passenger
    mail(to: @passenger.email, subject: "Welcome to My Awesome Site #{@passenger.name}")
  end
end
