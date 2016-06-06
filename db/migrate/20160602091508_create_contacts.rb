class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :title
      t.integer :gender
      t.string :tel
      t.string :mobile

      t.references :contactable, polymorphic: true
      t.timestamps null: false
    end
  end
end
