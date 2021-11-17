class RecipesController < ApplicationController
  before_action :set_user_recipe, only: %i[show update]
  def show
    @recipe_foods = @recipe.recipe_foods.includes(:food)
    @recipe
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
end
