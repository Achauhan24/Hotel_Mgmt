Rails.application.routes.draw do

 

  get 'sessions/new'

resources :customers do
  member do
    get :followers,:following
  end
end

root 'static_pages#home'		

  get '/signup', to: 'customers#new'
  post '/signup', to: 'customers#create'

  get '/home', to: 'static_pages#home'

  get '/help', to: 'static_pages#help'

  get '/about', to: 'static_pages#about'
  get '/login' , to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
  resources :microposts, only: [:create,:destroy]
  resources :relationships,only: [:create,:destroy]
  #patch '/customers/:id/edit', to: 'customers#update'

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
