class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :artist_id
      t.string :title
      t.text :image_id
      t.integer :price
      t.integer :disk_id
      t.integer :stock
      t.string :status
      t.integer :label_id

      t.timestamps
    end
  end
end
