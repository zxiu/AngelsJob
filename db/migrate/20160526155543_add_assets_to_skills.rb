class AddAssetsToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :assets, :text
  end
end
