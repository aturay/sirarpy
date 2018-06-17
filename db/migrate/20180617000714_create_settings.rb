class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.attachment :logo

      t.timestamps
    end
  end
end
