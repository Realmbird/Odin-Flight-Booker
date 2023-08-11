class AddAirportRefsToFlight < ActiveRecord::Migration[7.0]
  def change
    add_reference :flights, :arrival
    add_reference :flights, :departing
  end
end
