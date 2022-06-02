Rails.application.routes.draw do
  get 'users/index', to: 'users#index', as: 'usersindex'
  root "home#index"
  
  devise_for :users
  
  get 'users/:user_id/mysessions', to: 'workout_sessions#mysessions', as: 'mysessions'
  get 'workout_sessions/:workout_session_id/bookings/new', to: 'bookings#new'
  get 'bookings/mybookings', to: 'bookings#mybookings', as: 'mybookings'
  get 'buddies/:buddy_id/edit', to: 'buddies#edit',as: 'edit_buddy'  
  get 'workout_sessions/:workout_session_id/bookings/new', to: 'bookings#new'
  get 'bookings/:id/edit', to: 'bookings#edit', as: "edit_booking"
  get 'bookings/:id', to: 'bookings#show', as: "booking"
  put 'bookings/:id', to: 'bookings#update'
  patch 'bookings/:id', to: 'bookings#update'
  delete 'bookings/:id', to: 'bookings#destroy', as: "cancel_booking" 
  post 'workout_sessions/:workout_session_id/bookings', to: 'bookings#create'

  post 'buddies/:buddy_id/workout_sessions', to: 'workout_sessions#create'
  patch 'buddies/:buddy_id', to: 'buddies#update', as: 'update_buddy'
  put 'buddies/:buddy_id', to: 'buddies#update'

  get 'buddies/:buddy_id/mysessions/:id/participants/', to: 'workout_sessions#participants', as: 'participants'

  get 'payments/success', to: 'payments#success'
  post 'payments/webhook', to: 'payments#webhook'
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
end
