class AddTicketsToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :tickets, :integer
  end
end
