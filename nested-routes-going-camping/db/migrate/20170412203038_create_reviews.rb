class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :campground, foreign_key: true
      t.belongs_to :camper, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
