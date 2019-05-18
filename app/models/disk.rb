class Disk < ApplicationRecord
  belongs_to :product
  has_many :songs, dependent: :destroy
end
