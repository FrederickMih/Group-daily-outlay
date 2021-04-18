Rails.application.routes.draw do
  
  get 'outlay/index'
  get 'outlay/new'
  root 'users#profile'
  resources :groups
  get 'home/index'
  # root 'home#index'

  devise_for :users
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
