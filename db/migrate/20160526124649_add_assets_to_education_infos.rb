class AddAssetsToEducationInfos < ActiveRecord::Migration
  def change
    add_column :education_infos, :assets, :string
  end
end
