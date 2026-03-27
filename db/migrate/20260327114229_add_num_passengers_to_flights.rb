class AddNumPassengersToFlights < ActiveRecord::Migration[8.1]
  def change
    add_column :flights, :num_passengers, :integer
  end
end
