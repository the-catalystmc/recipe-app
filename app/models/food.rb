class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { only_integer: false }

  def food_quantity
    quantity = 0
    recipe_foods.each do |food|
      quantity += food.quantity
    end
    quantity
  end
end
