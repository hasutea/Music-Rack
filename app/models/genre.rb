class Genre < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :genre, uniqueness: true, presence: true
end
