class CreateAgentsUsers < ActiveRecord::Migration
  def change
    create_table :agents_users, id: false do |t|
      t.belongs_to :agent, index: true
      t.belongs_to :user, index: true
    end
  end
end
