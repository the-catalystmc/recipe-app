require 'rails_helper'

RSpec.describe 'Login page', js: true, type: :system do
  before(:all) do
    user_1 = User.create(name: "Kevin", email: "kevin@gmail.com", password: "234234", password_confirmation: "234234")
    user_1 = User.create(name: "Jose", email: "jose@gmail.com", password: "234234", password_confirmation: "234234")
    food_1 = Food.create(name: "mango", measurement_unit: "kg", price: 2.5, user_id: user_1.id)
    food_2 = Food.create(name: "banana", measurement_unit: "gr", price: 2, user_id: user_1.id)
    food_3 = Food.create(name: "chicken", measurement_unit: "kg", price: 18.5, user_id: user_1.id)
    recipe_1 = Recipe.create(name: "ceviche", preparation_time: 3, cooking_time: 0, description: "easy to cook", public: true, user_id: user_1.id)
    recipe_2 = Recipe.create(name: "chilcano", preparation_time: 1, cooking_time: 2, description: "easy to cook", public: false, user_id: user_1.id)
    RecipeFood.create(quantity: 2.5, recipe_id: recipe_1.id, food_id: food_1.id)
    RecipeFood.create(quantity: 2.5, recipe_id: recipe_1.id, food_id: food_2.id)
    RecipeFood.create(quantity: 2.5, recipe_id: recipe_1.id, food_id: food_3.id)
    RecipeFood.create(quantity: 2.5, recipe_id: recipe_2.id, food_id: food_1.id)
    RecipeFood.create(quantity: 2.5, recipe_id: recipe_2.id, food_id: food_2.id)
  end

  describe 'contains' do
    it 'username and password inputs, and Log in button' do
      visit new_user_session_path
      expect(page).to have_field('email')
      expect(page).to have_field('password')
      expect(page).to have_button('Log in')
    end
  end

  describe 'when I click the submit button' do
    it 'without filling in the username and the password, I get a detailed error' do
      visit new_user_session_path
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'after filling in the username and the password with incorrect data, I get a detailed error' do
      visit new_user_session_path
      fill_in 'email', with: 'user@example.com'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'after filling in the username and the password with correct data, I am redirected to the root page' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end

    it 'should show me the logout button' do
      visit new_user_session_path
      fill_in 'email', with: 'kevin@gmail.com'
      fill_in 'password', with: '234234'
      click_button 'Log in'
      expect(page).to have_button('Logout')
    end
  end
end
