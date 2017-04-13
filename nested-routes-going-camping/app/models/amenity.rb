class Amenity < ApplicationRecord
  has_many :campground_amenities
  has_many :campgrounds, through: :amenities
end
