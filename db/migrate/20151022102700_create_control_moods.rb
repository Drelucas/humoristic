class CreateControlMoods < ActiveRecord::Migration
  def change
    create_table :control_moods do |t|
      t.references :moods, index: true, foreign_key: true
      t.string :work
      t.references :users, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
