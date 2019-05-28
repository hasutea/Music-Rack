class ChangeColumnToPayment < ActiveRecord::Migration[5.2]
  # 変更内容
  def up
    change_column :payments, :order_status, :string, default: '受付'
  end

  # 変更前の状態
  def down
    change_column :payments, :order_status, :string
  end
end
