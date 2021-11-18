require 'rails_helper'

RSpec.describe 'Recipes', js: true, type: :system do
  before(:all) do
    user_1 = User.create(name: 'Kevin', email: 'kevin@gmail.com', password: '234234', password_confirmation: '234234')
    user_2 = User.create(name: 'Jose', email: 'jose@gmail.com', password: '234234', password_confirmation: '234234')
    food_1 = Food.create(name: 'mango', measurement_unit: 'kg', price: 2.5, user_id: user_1.id)
    food_2 = Food.create(name: 'banana', measurement_unit: 'gr', price: 2, user_id: user_1.id)
    food_3 = Food.create(name: 'chicken', measurement_unit: 'kg', price: 18.5, user_id: user_1.id)
    recipe_1 = Recipe.create(name: 'ceviche', preparation_time: 3, cooking_time: 0, description: 'easy to cook',
                             public: true, user_id: user_1.id)
    recipe_2 = Recipe.create(name: 'chilcano', preparation_time: 1, cooking_time: 2, description: 'easy to cook',
                             public: false, user_id: user_1.id)
    RecipeFood.create(quantity: 2.5, recipe_id: recipe_1.id, food_id: food_1.id)
    RecipeFood.create(quantity: 2.5, recipe_id: recipe_1.id, food_id: food_2.id)
    RecipeFood.create(quantity: 2.5, recipe_id: recipe_1.id, food_id: food_3.id)
    RecipeFood.create(quantity: 2.5, recipe_id: recipe_2.id, food_id: food_1.id)
    RecipeFood.create(quantity: 2.5, recipe_id: recipe_2.id, food_id: food_2.id)
  end

  describe 'should' do
    it 'list my recipes' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      visit recipes_path
      expect(page).to have_content('Ceviche')
      expect(page).to have_content('Chilcano')
    end

    it 'display the title Recipes' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      visit recipes_path
      expect(page).to have_content('Recipes')
    end

    it 'have the remove button' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      visit recipes_path
      expect(page).to have_link('Ceviche')
    end
  end

  describe 'when I click in one of my recipes' do
    it 'the page show me the preparation time' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      visit recipes_path
      click_link 'Chilcano'
      expect(page).to have_content('Preparation time: 1 hour')
    end

    it 'the page show me the ingredients' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      visit recipes_path
      click_link 'Ceviche'
      expect(page).to have_content('Mango')
      expect(page).to have_content('Banana')
      expect(page).to have_content('Chicken')
    end

    it 'the page take me to the recipe and have a button' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      visit recipes_path
      click_link 'Chilcano'
      expect(page).to have_button('Add ingredient')
    end

    it 'the page take me to the recipe and have a button' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      visit recipes_path
      click_link 'Ceviche'
      expect(page).to have_button('Generate Shopping List')
    end
  end
end
