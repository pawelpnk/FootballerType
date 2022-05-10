class AddFieldToMatch < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :show_result, :boolean, default: false
  end
end
