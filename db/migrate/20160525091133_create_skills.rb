class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name,     null: false
      t.string :level
      t.integer :catalog
      t.integer :user_id

      t.timestamps        null: false
    end
  end
end
