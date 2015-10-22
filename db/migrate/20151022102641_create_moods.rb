class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.string :type
      t.string :image_url

      t.timestamps null: false
    end
  end
end
