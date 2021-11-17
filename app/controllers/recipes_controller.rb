class RecipesController < ApplicationController
  before_action :set_user_recipes, only: %i[show update destroy]

  def index
    @recipes = current_user.recipes
  end

  def public_recipes
    @recipes = Recipe.all
  end

  def general_shopping_list
    @foods = current_user.foods
    @total_price = 0
    @foods.each do |food|
      @total_price += food.price * food.food_quantity
    end
  end

  def show
    @user = current_user
    @recipes = Recipe.all
    @recipe = @recipes.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = Recipe.new
  end

  def create
    if current_user.recipes.create(recipe_params)
      flash[:notice] = 'Recipe added successfully'
      redirect_to recipes_url
    else
      flash[:error] = 'Recipe couldn\'t be added'
      render :new
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    if @recipe.destroy
      flash[:notice] = 'Recipe deleted successfully'
    else
      flash[:error] = 'Recipe couldn\'t be deleted'
    end
    redirect_to recipes_url
  end

  private

  def recipe_params
    params.require(:Recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end

  def set_user_recipes
    @recipes = current_user.recipes
  end
end
