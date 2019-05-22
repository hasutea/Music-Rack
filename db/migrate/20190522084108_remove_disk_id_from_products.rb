class RemoveDiskIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :disk_id, :integer
  end
end
