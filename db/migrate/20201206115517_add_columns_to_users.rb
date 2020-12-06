class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :user_points
    add_column :users, :user_points, :integer, default: 0
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
