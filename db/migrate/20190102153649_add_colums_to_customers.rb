class AddColumsToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_attachment :customers, :photo
    add_column :customers, :published, :boolean, default: false
  end
end
