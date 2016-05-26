class AddAssetsToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :assets, :string
  end
end
