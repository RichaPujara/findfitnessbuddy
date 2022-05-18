Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  resources :buddies do
    resources :workout_sessions
  end

  resources :users do 
    resources :bookings
  end
  resources :bookings
  resources :workout_sessions

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
