class RecipesController < ApplicationController
  before_action :set_user_recipes, only: %i[show update destroy]

  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def create
    if current_user.recipes.create(food_params)
      flash[:notice] = 'Recipe added successfully'
      redirect_to recipes_url
    else
      flash[:error] = 'Recipe couldn\'t be added'
      render :new
    end
  end

  def destroy
    if @food.destroy
      flash[:notice] = 'Recipe deleted successfully'
    else
      flash[:error] = 'Recipe couldn\'t be deleted'
    end
    redirect_to recipes_url
  end

  private

  def food_params
    params.require(:Recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end

  def set_user_recipes
    @food = current_user.recipes.find(params[:id])
  end
end
