class Campsite < ApplicationRecord
  belongs_to :campground
  has_many :campers

  validates :campsite_num, uniqueness: true, numericality: { greater_than: 0 }
  
end
