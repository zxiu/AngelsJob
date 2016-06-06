class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.belongs_to :offer
      t.text    :cover_letter

      t.timestamps null: false
    end
  end
end
