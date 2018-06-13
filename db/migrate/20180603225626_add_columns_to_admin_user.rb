class AddColumnsToAdminUser < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_users, :firstname, :string
    add_column :admin_users, :lastname, :string
    add_column :admin_users, :phone, :string
    add_column :admin_users, :addres, :text
    add_column :admin_users, :social_url, :string
    add_attachment :admin_users, :picture
  end
end
