require 'rails_helper'

RSpec.describe 'Foods', js: true, type: :system do
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
    it 'list my foods' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      visit foods_path
      expect(page).to have_content('mango')
      expect(page).to have_content('banana')
      expect(page).to have_content('chicken')
    end

    it 'display the title Foods' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      visit foods_path
      expect(page).to have_content('Foods')
    end

    it 'have the button add food' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      visit foods_path
      expect(page).to have_button('Add food')
    end
  end

  describe 'when I click the Add food button' do
    it 'show me the name input' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      visit foods_path
      click_button 'Add food'
      expect(page).to have_field('Name')
    end

    it 'show me the name input' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      visit foods_path
      click_button 'Add food'
      expect(page).to have_field('Measurement unit')
    end

    it 'show me the name input' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      visit foods_path
      click_button 'Add food'
      expect(page).to have_field('Price')
    end
  end
end
