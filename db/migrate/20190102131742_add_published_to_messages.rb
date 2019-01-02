class AddPublishedToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :published, :boolean, default: false
  end
end
