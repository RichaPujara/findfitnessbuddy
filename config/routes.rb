Rails.application.routes.draw do
  resources :bookings
  resources :workout_sessions
  resources :addresses
  resources :business_profiles
  resources :profiles
  devise_for :users
  get 'users/index', to: "users#index"
  get 'users/:id', to: "users#show"
  get 'home/index'
  root to: "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
