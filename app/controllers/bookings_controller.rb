class BookingsController < ApplicationController
  def new
    if params[:bookings][:tickets].present?
      @booking = Booking.new
      @flight = Flight.find(params[:bookings][:flight_id])
      build_passengers(@booking)
    else 
      flash[:warning] = "Please Enter Tickets"
      redirect_to root_path
    end
  end

  def create
    @booking = Booking.new(book_params)
    if @booking.save
      redirect_to @booking
    else
      redirect_to root_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
  end

  def build_passengers(booking)
    @tickets = params[:bookings][:tickets].to_i
    @tickets.times do
      booking.passengers.build()
    end
  end
  private 
  def book_params
    params.require(:booking).permit(:flight_id,
      :tickets, passengers_attributes: [:name, :email, :_destroy])
  end
end
