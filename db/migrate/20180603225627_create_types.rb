class CreateTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :types do |t|
      t.string :title
      t.text :description
      t.attachment :image
      t.integer :position, default: 1
      t.boolean :published, default: true
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
