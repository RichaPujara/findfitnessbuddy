Rails.application.routes.draw do
  resources :workout_sessions
  resources :addresses
  resources :business_profiles
  resources :profiles
  devise_for :users
  get 'home/index'
  root to: "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
