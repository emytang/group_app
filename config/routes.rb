Rails.application.routes.draw do
  resources :users
  resources :groups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'groups/users'
  root 'groups#index'
end
