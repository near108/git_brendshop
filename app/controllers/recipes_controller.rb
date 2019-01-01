class RecipesController < ApplicationController
  
  require 'rqrcode'
  
  def index
    @recipe = Recipe.all
    @user = User.find(current_user.id)
    @qr = RQRCode::QRCode.new("Hello QR", size: 3, level: :h)
  end
  
  def new
    @recipe = Recipe.all
    @beans = Bean.all
  end
  
  def create
    Recipe.create(recipe_params)
  end
  
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @beans = Bean.all
  end
  
  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
  end

private
  def recipe_params
    params.permit(:recipe_name, :bean_1_id, :amount_1, :bean_2_id, :amount_2, :bean_3_id, :amount_3).merge(user_id: current_user.id)
  end

end
