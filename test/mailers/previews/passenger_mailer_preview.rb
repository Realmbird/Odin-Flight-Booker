# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def confirmation_email
    passenger = Passenger.last
    PassengerMailer.confirmation_email(passenger)
  end
end
