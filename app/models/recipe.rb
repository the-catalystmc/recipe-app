class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: { only_integer: false }
  validates :cooking_time, presence: true, numericality: { only_integer: false }
  validates :description, presence: true
  validates :public, presence: true


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

  def self.public_recipes
    Recipe.where("public = true ")
  end
end
