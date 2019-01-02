class CreateSocials < ActiveRecord::Migration[5.1]
  def change
    create_table :socials do |t|
      t.integer :title, default: 0
      t.string :url
      t.boolean :published, default: true
      t.integer :position, default: 1

      t.timestamps
    end
    add_index :socials, :title, unique: true
  end
end
