class CreateIntents < ActiveRecord::Migration
  def change
    create_table :intents do |t|
      t.string :keywords
      t.integer :branch
      t.integer :job_type
      t.integer :user_id
      t.string :postal_code
      t.integer :distance
      t.boolean :suspend, default: false
      t.timestamps null: false
    end
  end
end
