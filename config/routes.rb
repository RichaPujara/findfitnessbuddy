Rails.application.routes.draw do
  get 'users/index', to: 'users#index', as: 'usersindex'
  
  devise_for :users
  get 'home/index'
  get 'sessions/:session_id/bookings/new', to: 'bookings#new'
  get 'bookings/:id', to: 'bookings#show', as: "booking"
  get 'bookings/:id/edit', to: 'bookings#edit', as: "edit_booking"
  put 'bookings/:id', to: 'bookings#update'
  patch 'bookings/:id', to: 'bookings#update'
  delete 'bookings/:id', to: 'bookings#destroy', as: "cancel_booking" 
  post 'sessions/:session_id/bookings', to: 'bookings#create'
  resources :buddies do
    resources :workout_sessions do
      resources :bookings
    end
    
  end

  resources :workout_sessions do
      resources :bookings, only: [:new, :create]
    
  end

  resources :users do 
    resources :bookings
  end
  resources :bookings
  resources :workout_sessions

  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
