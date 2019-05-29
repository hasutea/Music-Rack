class Product < ApplicationRecord
  attachment :image
  belongs_to :label
  belongs_to :artist
  belongs_to :genre
  has_many :purchase_products
  has_many :carts, dependent: :destroy
  has_many :disks, inverse_of: :product
  accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true

  # throughオプションによりdisls経由でsongsにアクセスできるようになる
  has_many :songs, through: :disks

  validates :title, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :status, presence: true


end
