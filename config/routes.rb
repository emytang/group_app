Rails.application.routes.draw do
  resources :users
  resources :groups do  
    # resources :users, controller:"groups_users"
    resources :users, controller:"users_groups" 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "project/new_release" => 'project#new_release', :as => :new_release
  # get 'groups/users'
  # get 'ajax/:action', to: 'ajax#:action', :defaults => { :format => 'json' }

  get '/revoke_from_group', to: 'application#revoke_from_group', as: :revoke_from_group
  # get '/revoke_from_group', to: 'groups#revoke_from_group', as: :revoke_from_group

  root 'groups#index'
end
