class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.string :reference
      t.text   :content
      t.belongs_to :user
      t.belongs_to :company
      t.belongs_to :agent


      t.timestamps null: false
    end
  end
end
