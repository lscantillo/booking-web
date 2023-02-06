class AddSatusToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :status, :integer
  end
end
