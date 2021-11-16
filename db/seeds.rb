# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

leo = User.create!(
    name: 'Kevin',
    email: 'kevin@email.com',
    password: 'password',
    password_confirmation: 'password'
  )
  
  dan = User.create!(
    name: 'Rhyine',
    email: 'rhyine@email.com',
    password: 'password',
    password_confirmation: 'password'
  )
  
  milk = Food.create!(name: 'milk', measurement_unit: 'ml', price: 1.00, user_id: leo.id)
  
  eggs = Food.create!(name: 'egg', measurement_unit: 'unit', price: 0.25, user_id: leo.id)
  
  arepa = Food.create!(name: 'arepa', measurement_unit: 'unit', price: 0.10, user_id: dan.id)
  
  bread = Food.create!(name: 'bread', measurement_unit: 'grams', price: 0.005, user_id: dan.id)
  
  milk_with_eggs = Recipe.create!(name: 'Milk with Eggs', preparation_time: 5, cooking_time: 15,
                                  description: 'Tasty breakfast', public: true, user_id: leo.id)
  
  arepa_with_bread = Recipe.create!(name: 'Arepa and bread', preparation_time: 5, cooking_time: 10,
                                    description: 'Not a very healthy lunch', public: true, user_id: dan.id)
  
  RecipeFood.create!(quantity: 200, recipe_id: milk_with_eggs.id, food_id: milk.id)
  
  RecipeFood.create!(quantity: 2, recipe_id: milk_with_eggs.id, food_id: eggs.id)
  
  RecipeFood.create!(quantity: 5000, recipe_id: arepa_with_bread.id, food_id: bread.id)
  
  RecipeFood.create!(quantity: 3, recipe_id: arepa_with_bread.id, food_id: arepa.id)