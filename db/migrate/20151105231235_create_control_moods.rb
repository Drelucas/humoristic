class CreateControlMoods < ActiveRecord::Migration
  def change
    create_table :control_moods do |t|
      t.references :mood, index: true, foreign_key: true
      t.string :work
      t.references :user, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
