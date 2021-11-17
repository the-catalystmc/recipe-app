class FoodsController < ApplicationController
  before_action :set_user_food, only: %i[show update destroy]

  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    if current_user.foods.create(food_params)
      flash[:notice] = 'Food added successfully'
      redirect_to foods_url
    else
      flash[:error] = 'Food couldn\'t be added'
      render :new
    end
  end

  def destroy
    if @food.destroy
      flash[:notice] = 'Food deleted successfully'
    else
      flash[:error] = 'Post couldn\'t be deleted'
    end
    redirect_to foods_url
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end

  def set_user_food
    @food = current_user.foods.find(params[:id])
  end
end
