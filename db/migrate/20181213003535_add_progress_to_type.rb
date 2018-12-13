class AddProgressToType < ActiveRecord::Migration[5.1]
  def change
    add_column :types, :progress, :integer
  end
end
