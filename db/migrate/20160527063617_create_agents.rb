class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.string :domain
      t.string :logo
      t.integer    :type
      t.timestamps null: false
    end
  end
end
