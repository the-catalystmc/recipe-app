class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  def all_recipes
    recipe.order(created_at: :desc)
  end

  def total_price
    total = 0
    recipe_foods.includes(:food).each do |ingredient|
      total += ingredient.quantity * ingredient.food.price
    end
    total
  end
end
