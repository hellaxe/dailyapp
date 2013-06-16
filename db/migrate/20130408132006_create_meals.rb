class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :description
      t.integer :daily_food_record_id
      t.integer :food_id
      t.time :time
      t.timestamps
    end
  end
end
