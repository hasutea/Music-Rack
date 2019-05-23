class Product < ApplicationRecord
  attachment :image
  belongs_to :label
  belongs_to :artist
  belongs_to :genre
  has_many :purchase_products, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :disks, dependent: :destroy
  accepts_nested_attributes_for :disks, allow_destroy: true

end
