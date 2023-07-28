Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  # root "users#index"
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  post '/users/:id/posts/:post_id/like', to: 'posts#like', as: 'like'

end
