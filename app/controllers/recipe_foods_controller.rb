class RecipeFoodsController < ApplicationController
  before_action :set_user_recipe, only: %i[new create destroy edit update]
  before_action :set_user_recipe_food, only: %i[destroy edit update]

  def new
    @recipe_food = @recipe.recipe_foods.new
    @foods = current_user.foods
  end

  def create
    if @recipe.recipe_foods.create(food_params)
      flash[:notice] = 'Ingredient added successfully'
    else
      flash[:error] = 'Ingredient couldn\'t be added'
    end
    redirect_to recipe_url(@recipe)
  end

  def destroy
    if @recipe_food.destroy
      flash[:notice] = 'Ingredient deleted successfully'
    else
      flash[:error] = 'Ingredient couldn\'t be deleted'
    end
    redirect_to recipe_url(@recipe)
  end

  def edit
    @recipe_food
  end

  def update
    if @recipe_food.update(food_params)
      flash[:notice] = 'Ingredient updated successfully'
    else
      flash[:error] = 'Ingredient couldn\'t be updated'
    end
    redirect_to recipe_url(@recipe)
  end

  private

  def food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end

  def set_user_recipe_food
    @recipe_food = @recipe.recipe_foods.find(params[:id])
  end

  def set_user_recipe
    @recipe = current_user.recipes.find(params[:recipe_id])
  end
end
