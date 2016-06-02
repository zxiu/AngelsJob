class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :homepage
      t.belongs_to :agent
      t.timestamps null: false
    end
  end
end
