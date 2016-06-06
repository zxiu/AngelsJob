class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.string :link
      t.string :position
      t.text   :content
      t.belongs_to :user
      t.belongs_to :company
      t.belongs_to :agent
      t.date :online_at

      t.timestamps null: false
    end
  end
end
