class RecipesController < ApplicationController
  before_action :set_user_recipes, only: %i[show update destroy]
  before_action :set_user_recipe, only: %i[show update]

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
    @recipe_foods = @recipe.recipe_foods.includes(:food)
    @recipe
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
  
  def update
    if @recipe.update(public: !@recipe.public)
      if @recipe.public
        flash[:notice] = 'Public'
      else
        flash[:error] = 'Not Public'
      end
    else
      flash[:error] = 'Public status couldn\'t be updated'
    end
    redirect_to recipe_url(@recipe)
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end

  def set_user_recipe
    @recipe = current_user.recipes.find(params[:id])
  end

  def recipe_params
    params.require(:Recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end

  def set_user_recipes
    @recipes = current_user.recipes
  end
end