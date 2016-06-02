class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.belongs_to :offer
      t.belongs_to :user
      t.text    :cover_text

      t.timestamps null: false
    end
  end
end
