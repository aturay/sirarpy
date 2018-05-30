class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|
      t.integer :language
      t.integer :position, default: 1
      t.boolean :published, default: true

      t.timestamps
    end

    add_index :languages, :language, unique: true
  end
end
