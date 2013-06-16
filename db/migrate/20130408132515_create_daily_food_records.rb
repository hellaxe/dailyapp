class CreateDailyFoodRecords < ActiveRecord::Migration
  def change
    create_table :daily_food_records do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
