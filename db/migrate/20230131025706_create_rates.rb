class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.string :price
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
