class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :number_id
      t.string :email
      t.string :cellphone
      t.string :notes

      t.timestamps
    end
  end
end
