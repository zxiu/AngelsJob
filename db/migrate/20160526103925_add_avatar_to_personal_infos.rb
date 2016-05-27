class AddAvatarToPersonalInfos < ActiveRecord::Migration
  def change
    add_column :personal_infos, :avatar, :text
  end
end
