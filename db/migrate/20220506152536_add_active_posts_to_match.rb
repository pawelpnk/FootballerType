class AddActivePostsToMatch < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :isActive, :boolean, default: true
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
