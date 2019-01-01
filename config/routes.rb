Rails.application.routes.draw do
    
  devise_for :users
  
  root 'tops#index'
  get "users/:id" => "users#show", as: :mypage
  
  resources :tops, only: [:index]
  resources :recipes
  resources :arranges
  
  resource :admins, only: [:show]
  namespace :admins do
    resources :beans
    resources :columns, only: [:index]
  end
  
  
end
