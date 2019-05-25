class RemovePurchaseProductIdFromPayments < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :purchase_product_id, :integer
  end
end
