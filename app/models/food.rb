class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  def food_quantity
    quantity = 0
    recipe_foods.each do |food|
      quantity += food.quantity
    end
    quantity
  end
end
