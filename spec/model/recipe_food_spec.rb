require 'rails_helper'

RSpec.describe User, js: true, type: :model do
  before(:each) do
    @user_1 = User.create(name: 'Kevin', email: 'kevin@gmail.com', password: '234234', password_confirmation: '234234')
    @user_2 = User.create(name: 'Jose', email: 'jose@gmail.com', password: '234234', password_confirmation: '234234')
    @food_1 = Food.create(name: 'mango', measurement_unit: 'kg', price: 2.5, user_id: @user_1.id)
    @food_2 = Food.create(name: 'banana', measurement_unit: 'gr', price: 2, user_id: @user_1.id)
    @food_3 = Food.create(name: 'chicken', measurement_unit: 'kg', price: 18.5, user_id: @user_1.id)
    @recipe_1 = Recipe.create(name: 'ceviche', preparation_time: 3, cooking_time: 0, description: 'easy to cook',
                             public: true, user_id: @user_1.id)
    @recipe_2 = Recipe.create(name: 'chilcano', preparation_time: 1, cooking_time: 2, description: 'easy to cook',
                             public: false, user_id: @user_1.id)
    @recipe_food_1 = RecipeFood.create(quantity: 2.5, recipe_id: @recipe_1.id, food_id: @food_1.id)
    @recipe_food_2 = RecipeFood.create(quantity: 2.5, recipe_id: @recipe_1.id, food_id: @food_2.id)
    @recipe_food_3 = RecipeFood.create(quantity: 2.5, recipe_id: @recipe_1.id, food_id: @food_3.id)
    @recipe_food_4 = RecipeFood.create(quantity: 2.5, recipe_id: @recipe_2.id, food_id: @food_1.id)
    @recipe_food_5 = RecipeFood.create(quantity: 2.5, recipe_id: @recipe_2.id, food_id: @food_2.id)
  end

  it 'quantity should be present' do
    @recipe_food_1.quantity = nil
    expect(@recipe_food_1).to_not be_valid
  end

  it 'quantity should be numeric' do
    @recipe_food_1.quantity = "dunno"
    expect(@recipe_food_1).to_not be_valid
  end
end