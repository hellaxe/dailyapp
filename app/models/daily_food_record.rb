class DailyFoodRecord < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :user
  has_many :meals, dependent: :destroy

  def self.current(user_id)
    self.where(user_id: user_id, created_at: Time.now.all_day).last ||
        self.create(user_id: user_id)
  end

  def date
    self.created_at.strftime('%d.%m.%Y')
  end

  def protein
    self.meals.inject(0){|sum, m| sum += m.protein}.round(1)
  end

  def carbohydrate
    self.meals.inject(0){|sum, m| sum += m.carbohydrate}.round(1)
  end

  def fat
    self.meals.inject(0) {|sum, m| sum += m.fat}.round(1)
  end

  def energy
    self.meals.inject(0) {|sum, m| sum += m.energy}.round(1)
  end

  def size
    self.meals.inject(0) {|sum, m| sum += m.size}.round(1)
  end

end
