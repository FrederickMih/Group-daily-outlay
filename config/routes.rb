Rails.application.routes.draw do
  get 'outlay/index'
  get 'outlay/new'
  root 'users#profile'
  resources :outlays, only: %i[index new create]
  resources :groups
  get 'outlays/index_no_group', to: 'outlays#index_no_group'
  get 'home/index'
  # root 'home#index'

  devise_for :users
end
