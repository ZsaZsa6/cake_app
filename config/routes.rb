Rails.application.routes.draw do
  root to: "application#index"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create", as: "session"
  delete '/sessions', to: "sessions#destroy", as: "logout"
  resources :customers
  resources :customers do
    resources :cakes, only: [:index, :new]
  end
  resources :cakes, only: [:create, :edit, :show, :destroy]
  resources :tiers
 
  
end
