class RecipesController < ApplicationController
  
  def index
    @user = User.find(current_user.id)
  end
  
  def new
    @recipe = Recipe.all
    @bean = Bean.all
  end

end
