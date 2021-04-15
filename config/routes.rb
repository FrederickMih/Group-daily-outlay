Rails.application.routes.draw do
  
  get 'users/profile'
  resources :groups
  # get 'home/index'
  root 'home#index'

  devise_for :users
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
