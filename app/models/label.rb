class Label < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :label, uniqueness: true, presence: true
end
