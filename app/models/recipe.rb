class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  def all_recipes
    recipe.order(created_at: :desc)
  end
end
