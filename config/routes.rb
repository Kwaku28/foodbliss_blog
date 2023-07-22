Rails.application.routes.draw do
  get 'likes/create'
  # Defines the root path route ("/")
  # root "users#index"
  root 'users#index'

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/posts', to: 'posts#index'
  get '/users/:id/posts/new', to: 'posts#new'
  get '/users/:id/posts/:id', to: 'posts#show', as: 'post'
  post '/users/:id/posts/create', to: 'posts#create'
  get '/users/:id/posts/:post_id/comments/new', to: 'comments#new'
  post '/users/:id/posts/:post_id/comments/create', to: 'comments#create'
  post '/users/:id/posts/:post_id/likes', to: 'posts#likes', as: 'likes'
  post '/users/:id/posts/:post_id/likes/create', to: 'likes#create'

end
