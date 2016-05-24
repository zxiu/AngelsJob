class CreatePersonalInfos < ActiveRecord::Migration
  def change
    create_table :personal_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :tel
      t.string :mobile
      t.string :email
      t.date :birthday
      t.integer :gender

      t.timestamps null: false
    end
  end
end
