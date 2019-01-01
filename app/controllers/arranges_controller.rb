class ArrangesController < ApplicationController
  
  def index
    @arranges = Arrange.all.order("created_at DESC").page(params[:page]).per(5)
  end
  
end
