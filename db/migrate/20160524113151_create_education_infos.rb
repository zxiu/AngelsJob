class CreateEducationInfos < ActiveRecord::Migration
  def change
    create_table :education_infos do |t|
      t.string :insititude, null: false
      t.string :subject
      t.date   :begin
      t.date   :end
      t.string :graduation
      t.string :score
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
