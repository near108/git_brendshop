class RecipesController < ApplicationController
  
  def index
    @recipe = Recipe.all
    @user = User.find(current_user.id)
  end
  
  def new
    @recipe = Recipe.all
    @bean = Bean.all
  end
  
  def create
    Recipe.create(recipe_params)
  end

private
  def recipe_params
    params.permit(:recipe_name, :bean_1_id, :amount_1, :bean_2_id, :amount_2, :bean_3_id, :amount_3).merge(user_id: current_user.id)
  end

end
