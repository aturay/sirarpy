class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :fullname
      t.string :email
      t.string :phone
      t.string :addres
      t.string :ip

      t.timestamps
    end

    add_index :customers, :email, unique: true
  end
end
