class Admins::BeansController < AdminsController

  def index
    @beans = Bean.all
  end

  def new
    @beans = Bean.all
  end

  def create
    Bean.create(bean_params)
  end
  
  def edit
    @bean = Bean.find(params[:id])
  end
  
  def update
    bean = Bean.find(params[:id])
    if current_user.manager?
      bean.update(bean_params)
    end
  end
  
  def destroy
    bean = Bean.find(params[:id])
    if user_signed_in? && current_user.manager?
      bean.destroy
    end
  end
  
private
  def bean_params
    params.permit(:country, :grade, :roast, :comment)
  end
end
