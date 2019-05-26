class AddPaymentIdToPurchaseProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_products, :payment_id, :integer
  end
end
