class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :street
      t.string  :house_no
      t.string  :postal_code
      t.string  :city
      t.integer :country

      t.references :locatable, polymorphic: true

      t.timestamps null: false
    end
  end
end
