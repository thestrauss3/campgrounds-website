class CreateCampgroundAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :campground_amenities do |t|
      t.belongs_to :campground, foreign_key: true
      t.belongs_to :amenity, foreign_key: true
    end
  end
end
