Rails.application.routes.draw do
  root 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  patch '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/users/:user_id/posts', to: 'posts#create', as: 'user_posts'
  get '/users/:user_id/posts/:id/edit', to: 'posts#edit', as: 'edit_user_post'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'show_posts'
  patch '/users/:user_id/posts/:id', to: 'posts#update', as: 'update_posts'
  delete '/users/:user_id/posts/:id',to: 'posts#destroy', as: 'delete_posts'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
