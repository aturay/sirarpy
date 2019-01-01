class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :phones
      t.references :language, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
