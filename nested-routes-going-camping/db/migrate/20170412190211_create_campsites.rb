class CreateCampsites < ActiveRecord::Migration[5.0]
  def change
    create_table :campsites do |t|
      t.belongs_to :campground, foreign_key: true
      t.boolean :available, null: false, default: true
      t.integer :size, null: false
    end
  end
end
