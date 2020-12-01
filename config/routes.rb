Rails.application.routes.draw do
  root to: "application#index"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create", as: "session"
  delete '/sessions', to: "sessions#destroy", as: "logout"
  resources :customers
  resources :customers do
    resources :cakes, only: [:index, :new, :create]
  end
  resources :cakes, only: [:edit, :show, :destroy]
  resources :tiers
 
  
end
