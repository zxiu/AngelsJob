class CreateCvTemplates < ActiveRecord::Migration
  def change
    create_table :cv_templates do |t|
      t.string :title
      t.text :content
      t.integer :role
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
