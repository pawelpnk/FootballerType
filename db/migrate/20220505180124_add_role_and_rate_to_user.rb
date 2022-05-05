class AddRoleAndRateToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :integer
    add_column :users, :rate, :integer, default: 0
 end
end
