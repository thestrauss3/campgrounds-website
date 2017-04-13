
class Campground < ApplicationRecord
  has_many :campsites
  has_many :campground_amenities
  has_many :amenities, through: :campground_amenities
  has_many :reviews

  validates :name, :description, :fee, presence: true
  validates :fee, numericality: { greater_than_or_equal_to: 0 }

  def supplies
    campground_supplies = []
    campers.each do |camper|
      campground_supplies += camper.supplies
    end
    campground_supplies
  end

  def campers
    campground_campers = []
    campsites.each do |campsite|
      campground_campers += campsite.campers
    end
    campground_campers
  end

  def average_rating
    reviews.pluck(:rating).sum.to_f / reviews.size
  end
end
