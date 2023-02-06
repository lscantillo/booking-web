class AddTitleToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :title, :string
  end
end
