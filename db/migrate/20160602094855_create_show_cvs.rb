class CreateShowCvs < ActiveRecord::Migration
  def change
    create_table :show_cvs do |t|
      t.string :hash
      t.belongs_to :application
      
      t.timestamps null: false
    end
  end
end
