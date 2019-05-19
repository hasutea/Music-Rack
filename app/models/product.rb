class Product < ApplicationRecord
  attachment :image
  belongs_to :label
  belongs_to :artist
  belongs_to :genre
  has_many :disks, dependent: :destroy
  has_many :purchase_products, dependent: :destroy
  has_many :carts, dependent: :destroy

end
