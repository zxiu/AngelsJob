class AddUserIdToCareerInfos < ActiveRecord::Migration
  def change
    add_column :career_infos, :user_id, :integer
  end
end
