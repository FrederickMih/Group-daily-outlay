Rails.application.routes.draw do
  
  get 'outlay/index'
  get 'outlay/new'
  root 'users#profile'
  resources :outlays
  resources :groups, only: %i[index new create show]
  get 'expenses/index_no_group', to: 'expenses#index_no_group'
  get 'home/index'
  # root 'home#index'

  devise_for :users
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
