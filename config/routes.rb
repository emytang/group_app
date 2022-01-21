Rails.application.routes.draw do
  resources :users
  resources :groups do  
    # resources :users, controller:"groups_users"
    resources :users, controller:"users_groups" 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'groups/users'

  get '/revoke_from_group', to: 'application#revoke_from_group', as: :revoke_from_group
  get 'groups/:group_id/add_to_group/:id', to: 'groups#add_to_group', as: :add_to_group
  # get 'groups/:id', to: 'groups#show'

  root 'groups#index'
end
