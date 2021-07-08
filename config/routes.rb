Rails.application.routes.draw do
  get 'outlay/index'
  get 'outlay/new'
  devise_for :users
  root 'users#profile'
  resources :outlays, only: %i[index new create index_no_group]
  resources :groups
  get 'sign_up', to: 'users#new'
  get 'outlays/index_no_group', to: 'outlays#index_no_group'
  get 'external', to: 'outlays#external_outlay'
  get 'home/index'
end
