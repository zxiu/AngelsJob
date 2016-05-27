class AddAssetsToCareerInfos < ActiveRecord::Migration
  def change
    add_column :career_infos, :assets, :text
  end
end
