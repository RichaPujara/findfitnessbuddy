Rails.application.routes.draw do
  # resources :bookings
  # resources :workout_sessions
  # resources :addresses
  
  resources :business_profiles
  resources :business_profiles do
    resources :workout_sessions
  end

  resources :users do
    resources :bookings  
  end

  resources :users do
    resources :profiles
  end
  
  resources :profiles do 
    resources :addresses
  end
  # # routes for workout sessions
  # get '/business_profiles/:business_profile_id/workout_sessions', to: "workout_sessions#index", as: "workout_sessions"
  # post '/business_profiles/:business_profile_id/workout_sessions', to: "workout_sessions#create"
  # get '/business_profiles/:business_profile_id/workout_sessions/new', to: "workout_sessions#new", as: "new_workout_sessions"
  # get '/business_profiles/:business_profile_id/workout_sessions/:id/edit', to: "workout_sessions#edit", as: "edit_workout_session"
  # get '/business_profiles/:business_profile_id/workout_sessions/:id', to: "workout_sessions#show", as: "workout_session"
  # patch '/business_profiles/:business_profile_id/workout_sessions/:id', to: "workout_sessions#update"
  # put '/business_profiles/:business_profile_id/workout_sessions/:id', to: "workout_sessions#update"
  # delete '/business_profiles/:business_profile_id/workout_sessions/:id', to: "workout_sessions#destroy"




  #routes for business profiles
  # get '/business_profiles', to: "business_profiles#index", as: "business_profiles"
  # get '/business_profiles/:id/workout_sessions', to: "business_profiles#workout_sessions", as: "business_profiles_workout_sessions"
  # post '/business_profiles', to: "business_profiles#create"
  # get '/business_profiles/new', to: "business_profiles#new", as: "new_business_profile"
  # get '/business_profiles/:id/edit', to: "business_profiles#edit", as: "edit_business_profile"
  # get '/business_profiles/:id', to: "business_profiles#show", as: "business_profile"
  # patch '/business_profiles/:id', to: "business_profiles#update"
  # put '/business_profiles/:id', to: "business_profiles#update"
  # delete '/business_profiles/:id', to: "business_profiles#destroy"

  # # routes for user profile
  # # resources :profiles
  # # get 'users/:id/profiles', to: "profiles#index", as: "profiles"
  # # post 'users/:id/profiles', to: "profiles#create"
  # # get 'users/:id/profiles/new', to: "profiles#new", as: "new_profile"
  # # get 'users/:id/profiles/:id/edit', to: "profiles#edit", as: "edit_profile"
  # # get 'users/:id/profiles/:id', to: "profiles#show", as: "profile"
  # # patch 'users/:id/profiles/:id', to: "profiles#update"
  # # put 'users/:id/profiles/:id', to: "profiles#update"
  # # delete 'users/:id/profiles/:id', to: "profiles#destroy"

  # routes for users and user management
  devise_for :users
  get 'users/index', to: "users#index"
  get 'users/:id', to: "users#show"
  get 'home/index'

  # root path
  root to: "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
