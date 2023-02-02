Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :users, only: [:show]

  get '/users/:user_id/items', to: 'users#index'
  get '/users/:user_id/items/:id', to: 'users#item'
  post '/users/:user_id/items', to: 'users#create'
end
