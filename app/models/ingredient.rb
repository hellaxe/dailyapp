class Ingredient < ActiveRecord::Base
  attr_accessible :food_id, :recipe_id, :size
  belongs_to :food
  belongs_to :recipe

  def protein
    food.protein * size / 100
  end

  def carbohydrate
    food.carbohydrate * size / 100
  end

  def fat
    food.fat * size / 100
  end

  def energy
    food.energy * size / 100
  end

end
