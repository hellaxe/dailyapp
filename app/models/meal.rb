class Meal < ActiveRecord::Base
  attr_accessible :daily_food_record_id, :description, :time, :portions_attributes, :food_attributes
  has_many :portions, dependent: :destroy
  belongs_to :daily_food_record
  has_one :food, as: :consumable, dependent: :destroy

  accepts_nested_attributes_for :portions
  accepts_nested_attributes_for :food

  scope :user, lambda {|user_id| where(user_id: user_id)}
  scope :in_day, lambda {|time| where(created_at: time.all_day)}

  #TODO: Add module "Consumable"

  def name
    self.food.name
  end

  def fill_nested_attributes(user_id)
    self.daily_food_record = DailyFoodRecord.current(user_id)
    self.daily_food_record.meals << self
    self.food.user_id = user_id
    self.fill_total
    self.food.save
    self.daily_food_record.calculate_totals
  end

  def build_nested_attributes
    self.build_food
    self.portions.build
    self.portions.build
  end

  def size
    @size || calculate_size
  end

  def protein
    self.food.protein.round(1)
  end

  def carbohydrate
    self.food.carbohydrate.round(1)
  end

  def fat
    self.food.fat.round(1)
  end

  def energy
    self.food.energy.round(1)
  end

  def fill_total
    self.food.protein = self.portions.inject(0){|sum, elem| sum += elem.protein}
    self.food.carbohydrate = self.portions.inject(0){|sum, elem| sum += elem.carbohydrate}
    self.food.fat = self.portions.inject(0){|sum, elem| sum += elem.fat}
    self.food.energy = self.portions.inject(0){|sum, elem| sum += elem.energy}
  end

  private
  def calculate_size
    @size = portions.inject(0){|sum, elem| sum += elem.size}
  end
end
