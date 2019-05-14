class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :purchase_product_id
      t.integer :user_id
      t.integer :payment_method_id
      t.string :shipping_last_name
      t.string :shipping_first_name
      t.integer :shipping_postal_code
      t.string :shipping_address
      t.string :order_status

      t.timestamps
    end
  end
end
