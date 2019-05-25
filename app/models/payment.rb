class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :payment_method
  has_many :purchase_products, dependent: :destroy
  accepts_nested_attributes_for :purchase_products, allow_destroy: true
  has_one :address, through: :users
end
