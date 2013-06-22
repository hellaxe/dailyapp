class Food < ActiveRecord::Base
  attr_accessible :energy, :carbohydrate, :fat, :name, :protein, :user_id
  belongs_to :consumable, polymorphic: true
  belongs_to :user

  scope :products_and_recipes, lambda { where('consumable_type = ? OR consumable_type = ?', 'Product', 'Recipe') }
end
