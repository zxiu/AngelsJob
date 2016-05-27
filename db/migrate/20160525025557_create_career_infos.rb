class CreateCareerInfos < ActiveRecord::Migration
  def change
    create_table :career_infos do |t|
      t.string :employer,       null: false
      t.string :position
      t.text   :activity
      t.date   :begin
      t.date   :end
      t.text   :extra
      t.timestamps              null: false
    end
  end
end
