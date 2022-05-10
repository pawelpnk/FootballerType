class AddAdditionalToPage < ActiveRecord::Migration[6.0]
  def change
    change_column :matches, :all_points, :numeric, default: 0
    add_column :pages, :points, :numeric, default: 0
  end
end
