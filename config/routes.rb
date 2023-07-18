Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "users#index"
  root 'users#index'

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:author_id/posts', to: 'posts#index'
  get '/users/:author_id/posts/:id', to: 'posts#show'

end
