class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  def all_recipes
    recipe.order(created_at: :desc)
  end
end
