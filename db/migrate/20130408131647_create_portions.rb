class CreatePortions < ActiveRecord::Migration
  def change
    create_table :portions do |t|
      t.float :size
      t.integer :meal_id
      t.integer :food_id

      t.timestamps
    end
  end
end
