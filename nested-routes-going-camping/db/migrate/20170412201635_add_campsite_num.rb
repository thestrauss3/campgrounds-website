class AddCampsiteNum < ActiveRecord::Migration[5.0]
  def change
    add_column :campsites, :campsite_num, :integer, unique: true
  end
end
