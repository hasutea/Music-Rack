class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address
      t.integer :postal_code

      t.timestamps
    end
  end
end
