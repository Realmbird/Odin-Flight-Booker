class FlightsController < ApplicationController
  before_action :search, only: :index
  # added
  def search
    @flights = Flight.new
    if params[:flights]
      @flights = Flight.all
      # departure airports
      if params[:flights][:departure_airport] != ""
        # changed from @flights.where(departing_id: params[:flights][:departure_airport])
        @flights = @flights.where(departing_id: params[:flights][:departure_airport])
      end
      #arrival airports
      if params[:flights][:arrival_airport] != ""
        @flights = @flights.where(arrival_id: params[:flights][:arrival_airport])
      end
      # start
      if params[:flights][:'start(1i)'] != "" && params[:flights][:'start(2i)'] != "" && params[:flights][:'start(3i)'] != ""
        date = Date.new params[:flights][:'start(1i)'].to_i, params[:flights][:'start(2i)'].to_i, params[:flights][:'start(3i)'].to_i
        @flights = @flights.where("DATE(start) = ?", date)
      end
    else 
      @flights = Flight.all
    end
  end
  def index
    @booking = Booking.new
  end

  private 
  def flight_params
    params.require(:flights).permit(:'start(1i)', :'start(2i)', :'start(3i)', :arrival_airport, :departure_airport, :passengers);
    # params.require(:flights).permit(:start, :arrival_airport, :departure_airport, :passengers);
  end
end
