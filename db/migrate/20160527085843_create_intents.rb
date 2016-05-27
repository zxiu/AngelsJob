class CreateIntents < ActiveRecord::Migration
  def change
    create_table :intents do |t|
      t.text :keywords
      t.integer :branch
      t.integer :type
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
