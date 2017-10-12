Rails.application.routes.draw do
  root 'home#index'
  get '/users', to: 'users#search', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  get 'profile/:username', to: 'users#profile', as: 'profile'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :posts, only: [:create, :update, :destroy] do
    resources :comments, only: [:create, :update, :destroy]
  end
  resources :posts, only: [] do
    resources :post_likes, only: [:create, :destroy]
  end
  resources :comments, only: [] do
    resources :comment_likes, only: [:create, :destroy]
  end
  resources :friendships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
