class DailyFoodRecord < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_one :food, as: :consumable, dependent: :destroy, autosave: true

  def self.current(user_id)
    self.where(user_id: user_id, created_at: Time.now.all_day).last ||
        self.create(user_id: user_id)
  end

  def date
    self.created_at.strftime('%d.%m.%Y')
  end

  def empty?
    self.food.exists?
  end

  # TODO: make a nested routes

  def calculate_totals
    self.build_food unless self.food
    self.food.protein = self.meals.inject(0){|sum, m| sum += m.protein}
    self.food.carbohydrate = self.meals.inject(0){|sum, m| sum += m.carbohydrate}
    self.food.fat = self.meals.inject(0) {|sum, m| sum += m.fat}
    self.food.energy = self.meals.inject(0) {|sum, m| sum += m.energy}
    self.size = self.meals.inject(0) {|sum, m| sum += m.size}
    self.save
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

end
