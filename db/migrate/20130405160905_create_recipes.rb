class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :description
    end
  end
end
