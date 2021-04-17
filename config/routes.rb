Rails.application.routes.draw do
  
  get 'outlay/index'
  get 'outlay/new'
  get 'users/profile'
  resources :groups
  # get 'home/index'
  root 'home#index'

  devise_for :users, only: %i[new create profile]
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
