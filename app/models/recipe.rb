class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  def all_recipes
    recipe.order(created_at: :desc)
  end

  # def food_count
  #   @recipe.recipe_foods.food.count()
  # end

  # def food_price

  # end
end
