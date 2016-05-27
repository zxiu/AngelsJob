class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.string :homepage
      t.string :logo
      t.integer    :locate
      t.timestamps null: false
    end
  end
end
