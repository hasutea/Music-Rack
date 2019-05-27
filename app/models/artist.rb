class Artist < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :artist, uniqueness: true, presence: true
end
