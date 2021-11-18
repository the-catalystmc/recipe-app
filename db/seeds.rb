# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(name: "Kevin", email: "kevin@gmail.com", password: "234234", password_confirmation: "234234")
user_2 = User.create(name: "Jose", email: "jose@gmail.com", password: "234234", password_confirmation: "234234")
food_1 = Food.create(name: "fish", measurement_unit: "kg", price: 10, user_id: user_1.id)
food_2 = Food.create(name: "lemon", measurement_unit: "kg", price: 3, user_id: user_1.id)
food_3 = Food.create(name: "sweet potato", measurement_unit: "kg", price: 2, user_id: user_1.id)
food_4 = Food.create(name: "meat", measurement_unit: "kg", price: 18, user_id: user_1.id)
food_5 = Food.create(name: "onion", measurement_unit: "kg", price: 1.5, user_id: user_1.id)
food_6 = Food.create(name: "potato", measurement_unit: "kg", price: 2, user_id: user_1.id)
recipe_1 = Recipe.create(name: "ceviche", preparation_time: 3, cooking_time: 0, description: "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ducimus illo aut nam iusto eos libero iure delectus reiciendis corrupti consectetur. Dicta repellat earum recusandae eaque reiciendis optio aliquid quo itaque. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ducimus illo aut nam iusto eos libero iure delectus reiciendis corrupti consectetur. Dicta repellat earum recusandae eaque reiciendis optio aliquid quo itaque.", public: true, user_id: user_1.id)
recipe_2 = Recipe.create(name: "lomo saltado", preparation_time: 1, cooking_time: 2, description: "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ducimus illo aut nam iusto eos libero iure delectus reiciendis corrupti consectetur. Dicta repellat earum recusandae eaque reiciendis optio aliquid quo itaque. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ducimus illo aut nam iusto eos libero iure delectus reiciendis corrupti consectetur. Dicta repellat earum recusandae eaque reiciendis optio aliquid quo itaque.", public: false, user_id: user_1.id)
RecipeFood.create(quantity: 2.5, recipe_id: recipe_1.id, food_id: food_1.id)
RecipeFood.create(quantity: 2, recipe_id:  recipe_1.id, food_id: food_2.id)
RecipeFood.create(quantity: 2, recipe_id: recipe_1.id, food_id: food_3.id)
RecipeFood.create(quantity: 5, recipe_id: recipe_2.id, food_id: food_4.id)
RecipeFood.create(quantity: 1.5, recipe_id: recipe_2.id, food_id: food_5.id)
RecipeFood.create(quantity: 3, recipe_id: recipe_2.id, food_id: food_6.id)
