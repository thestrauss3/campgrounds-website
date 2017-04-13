class CampgroundAmenity < ApplicationRecord
  belongs_to :campground
  belongs_to :amenity
end
