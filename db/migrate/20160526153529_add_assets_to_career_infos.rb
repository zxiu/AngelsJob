class AddAssetsToCareerInfos < ActiveRecord::Migration
  def change
    add_column :career_infos, :assets, :string
  end
end
