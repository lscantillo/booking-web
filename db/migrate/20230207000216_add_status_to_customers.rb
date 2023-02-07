class AddStatusToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :status, :integer, default: 0
  end
end
