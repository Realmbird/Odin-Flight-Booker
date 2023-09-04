class PassengerMailer < ApplicationMailer
  default to: "happychristopher777@gmail.com" 
  def confirmation_email(passenger)
    @passenger = passenger
    mail(subject: "Welcome to My Awesome Site #{@passenger.name}")
  end
end
