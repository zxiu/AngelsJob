class CreateCareerInfos < ActiveRecord::Migration
  def change
    create_table :career_infos do |t|
      t.string :organisation

      t.timestamps null: false
    end
  end
end
