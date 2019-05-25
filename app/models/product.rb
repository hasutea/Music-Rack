class Product < ApplicationRecord
  attachment :image
  belongs_to :label
  belongs_to :artist
  belongs_to :genre
  has_many :purchase_products, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :disks, inverse_of: :product
  accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true

  # throughオプションによりdisls経由でsongsにアクセスできるようになる
  has_many :songs, through: :disks

end
