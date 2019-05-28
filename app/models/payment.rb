class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :payment_method
  has_many :purchase_products, dependent: :destroy
  accepts_nested_attributes_for :purchase_products, allow_destroy: true
  has_one :address, through: :users

  validates :shipping_last_name, presence: true
  validates :shipping_first_name, presence: true
  validates :shipping_postal_code, presence: true
  validates :shipping_address, presence: true
  validates :payment_method_id, acceptance: true
end
