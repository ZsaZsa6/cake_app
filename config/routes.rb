Rails.application.routes.draw do
  root to: "application#index"
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create", as: "session"
  delete '/sessions', to: "sessions#destroy", as: "logout"
  get '/search' => 'cakes#search', :as => 'search_page'
  resources :customers
  resources :customers do
    resources :cakes, only: [:index, :new]
  end
  resources :cakes, only: [:create, :edit, :show, :destroy]
  resources :cakes do
    resources :tiers, only: [:new, :index]

  end
  resources :tiers, only: [:create, :show, :edit, :update, :destroy]
   
end
