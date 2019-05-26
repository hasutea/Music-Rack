class PaymentMethod < ApplicationRecord
  has_many :payments, dependent: :destroy
  accepts_nested_attributes_for :payments, allow_destroy: true
end
