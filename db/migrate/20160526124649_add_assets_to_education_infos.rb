class AddAssetsToEducationInfos < ActiveRecord::Migration
  def change
    add_column :education_infos, :assets, :text
  end
end
