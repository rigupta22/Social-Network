Rails.application.routes.draw do
  root 'users#index'
  get 'users/index'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  patch '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
