class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.text :owerview
      t.integer :price
      t.references :type, foreign_key: true
      t.references :admin_user, foreign_key: true
      t.references :language, foreign_key: true
      t.boolean :published, default: true

      t.timestamps
    end
  end
end
