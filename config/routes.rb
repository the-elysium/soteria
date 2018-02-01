Rails.application.routes.draw do
  get 'key_pair', to:'key_pair#show'
  post 'key_pair', to:'key_pair#new'
  post 'key_pair/upload', to:'key_pair#upload'
  put 'key_pair', to:'key_pair#update'

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "user", to: 'users#index' 
  get "public_key", to: 'system#public_key'
end
