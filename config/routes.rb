Rails.application.routes.draw do
  get 'users/index', to: 'users#index', as: 'usersindex'
  
  devise_for :users
  get 'home/index'

  get 'users/:user_id/mysessions', to: 'workout_sessions#mysessions', as: 'mysessions'
  get 'workout_sessions/:workout_session_id/bookings/new', to: 'bookings#new'
  get 'bookings/mybookings', to: 'bookings#mybookings', as: 'mybookings'
  get 'bookings/:id/edit', to: 'bookings#edit', as: "edit_booking"
  get 'bookings/:id', to: 'bookings#show', as: "booking"
  put 'bookings/:id', to: 'bookings#update'
  patch 'bookings/:id', to: 'bookings#update'
  delete 'bookings/:id', to: 'bookings#destroy', as: "cancel_booking" 
  post 'workout_sessions/:workout_session_id/bookings', to: 'bookings#create'
  get 'buddies/:buddy_id/workout_sessions/new', to: 'workout_sessions#new', as: "new_buddy_workout_session"
  post 'buddies/:buddy_id/workout_sessions', to: 'workout_sessions#create'
  get '/buddies/:buddy_id/edit', to: 'buddies#edit',as: 'edit_buddy'
  patch 'buddies/:buddy_id', to: 'buddies#update', as: 'update_buddy'
  put 'buddies/:buddy_id', to: 'buddies#update'
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
