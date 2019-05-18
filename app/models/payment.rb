class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :payment_method
  has_many :purchase_products, dependent: :destroy
end
