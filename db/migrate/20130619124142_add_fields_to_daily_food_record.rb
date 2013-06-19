class AddFieldsToDailyFoodRecord < ActiveRecord::Migration
  def change
    add_column :daily_food_records, :size, :float
  end
end
