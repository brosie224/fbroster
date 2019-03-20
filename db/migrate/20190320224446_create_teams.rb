class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :conference
      t.string :division
      t.integer :user_id
    end
  end
end
