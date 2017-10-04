Rails.application.routes.draw do
  root 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # post '/users/:user_id/posts', to: 'posts#create', as: 'user_posts'
  # get '/users/:user_id/posts/:id/edit', to: 'posts#edit', as: 'edit_user_post'
  # get '/users/:user_id/posts/:id', to: 'posts#show', as: 'show_posts'
  # patch '/users/:user_id/posts/:id', to: 'posts#update', as: 'update_posts'
  # delete '/users/:user_id/posts/:id',to: 'posts#destroy', as: 'delete_posts'
  # post '/users/:user_id/posts/:post_id/comments', to: 'comments#create', as: 'user_comments'
  # patch '/users/:user_id/posts/:post_id/comments/:id', to: 'comments#update', as: 'update_comments'
  # delete '/users/:user_id/posts/:post_id/comments/:id',to: 'comments#destroy', as: 'delete_comments'
  #resources :comments, path: '/admin/articles', only: [:create, :update, :delete]
  resources :posts, only: [:create, :update, :destroy] do
    resources :comments, only: [:create, :update, :destroy]
  end
  resources :posts, only: [] do
    resources :post_likes, only: [:create, :destroy]
  end
  resources :comments, only: [] do
    resources :comment_likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
