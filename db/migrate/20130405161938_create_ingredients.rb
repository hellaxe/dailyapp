class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.float :size
      t.integer :recipe_id
      t.integer :food_id

      t.timestamps
    end
  end
end
