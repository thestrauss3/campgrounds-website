class Review < ApplicationRecord
  belongs_to :campground
  belongs_to :camper
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5, only_integer: true }
end
