class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.float :protein
      t.float :carbohydrate
      t.float :fat
      t.float :energy
      t.integer :user_id
      t.integer :consumable_id
      t.string :consumable_type

      t.timestamps
    end
  end
end
