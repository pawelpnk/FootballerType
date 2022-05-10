class AddAdditionalFieldsToMatch < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :best_typer, :string
    add_column :matches, :all_points, :numeric
    add_column :matches, :highest_result, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
