Rails.application.routes.draw do
    
  devise_for :users
  
  root 'tops#index'
  resource :tops, only: [:index]
  get "users/:id" => "users#show", as: :mypage
  resource :admins, only: [:index]
  
end
