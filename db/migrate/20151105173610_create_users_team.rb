class CreateUsersTeam < ActiveRecord::Migration
  def change
    create_table :users_teams do |t|
    	t.integer :team_id, index: true, foreign_key: true
    	t.integer :user_id, index: true, foreign_key: true

    	t.timestamps null: false
    end
  end
end
