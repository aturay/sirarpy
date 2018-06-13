class CreateProductImages < ActiveRecord::Migration[5.1]
  def change
    create_table :product_images do |t|
      t.attachment :image
      t.integer :position, default: 1
      t.boolean :published, default: true
      t.references :product, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
