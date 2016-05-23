class AddUserIdToPersonalInfos < ActiveRecord::Migration
  def change
    add_column :personal_infos, :user_id, :integer
  end
end
