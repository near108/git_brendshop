class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #ログイン後にマイページへ遷移
    def after_sign_in_path_for(resource) 
      mypage_path(resource)
    end
  
end
