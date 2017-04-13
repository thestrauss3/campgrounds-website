class UpdateCampgrounds < ActiveRecord::Migration[5.0]
  def change
    add_column :campgrounds, :description, :text, default: "no description yet", null: false
    add_column :campgrounds, :fee, :money, default: 0, null: false
  end
end
