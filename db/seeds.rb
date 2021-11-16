# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(name: "Kevin", email: "kevin@gmail.com", password: "234234", password_confirmation: "234234")
food_1 = Food.create(name: "mango", measurement_unit: "kg", price: 2.5, user_id: user.id)
food_2 = Food.create(name: "banana", measurement_unit: "gr", price: 2, user_id: user.id)
food_3 = Food.create(name: "chicken", measurement_unit: "kg", price: 18.5, user_id: user.id)
recipe_1 = Recipe.create(name: "ceviche", preparation_time: 3, cooking_time: 0, description: "easy to cook", public: true, user_id: user.id)
recipe_2 = Recipe.create(name: "chilcano", preparation_time: 1, cooking_time: 2, description: "easy to cook", public: true, user_id: user.id)
RecipeFood.create(quantity: 2.5, recipe_id: recipe_1.id, food_id: food_1.id)
RecipeFood.create(quantity: 2.5, recipe_id: recipe_1.id, food_id: food_2.id)
RecipeFood.create(quantity: 2.5, recipe_id: recipe_1.id, food_id: food_3.id)
RecipeFood.create(quantity: 2.5, recipe_id: recipe_2.id, food_id: food_1.id)
RecipeFood.create(quantity: 2.5, recipe_id: recipe_2.id, food_id: food_2.id)