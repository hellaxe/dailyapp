class Product < ActiveRecord::Base
  attr_accessible :manufacturer, :food_attributes
  has_one :food, as: :consumable, dependent: :destroy
  accepts_nested_attributes_for :food
end
