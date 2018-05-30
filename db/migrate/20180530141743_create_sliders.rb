class CreateSliders < ActiveRecord::Migration[5.1]
  def change
    create_table :sliders do |t|
      t.string :title
      t.string :sub_title
      t.text :description
      t.attachment :image
      t.integer :position, default: 1
      t.boolean :published, default: true
      t.references :language, foreign_key: true

      t.timestamps
    end

    def down
      delete_table :sliders
    end
  end
end
