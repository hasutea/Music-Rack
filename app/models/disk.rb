class Disk < ApplicationRecord
  belongs_to :product
  has_many :songs, inverse_of: :disk
  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
end
