class Recipe < ActiveRecord::Base
  attr_accessible :description, :food_attributes, :ingredients_attributes
  belongs_to :user
  has_one :food, as: :consumable, dependent: :destroy
  has_many :ingredients, dependent: :destroy

  accepts_nested_attributes_for :food
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  before_update :fill_total
  before_save :fill_total

  def size
    @size || calculate_size
  end

  def total_protein
    ingredients.inject(0){|sum, elem| sum += elem.protein} * 100 / size
  end

  def total_carbohydrate
    ingredients.inject(0){|sum, elem| sum += elem.carbohydrate} * 100 / size
  end

  def total_fat
    ingredients.inject(0){|sum, elem| sum += elem.fat} * 100 / size
  end

  def total_energy
    ingredients.inject(0){|sum, elem| sum += elem.energy} * 100 / size
  end

  def fill_total
    self.food.protein = total_protein.round(1)
    self.food.carbohydrate = total_carbohydrate.round(1)
    self.food.fat = total_fat.round(1)
    self.food.energy = total_energy.round(1)
  end

  private
  def calculate_size
    @size = ingredients.inject(0){|sum, elem| sum += elem.size}
  end
end
