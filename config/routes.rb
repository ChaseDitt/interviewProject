Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Devise routes for User authentication
  devise_for :users

  # Custom route for sign out to ensure it uses a GET request
  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  # Routes for Logging in (also set root to the login itself)
  root to: 'pages#login'
  get 'login', to: 'pages#login'
  get 'sign_up', to: 'pages#create'
  get 'home', to: 'pages#home'
  get 'card_create', to: 'pages#card_create', as: 'card_create'
  post 'create_card', to: 'pages#create_card', as: 'create_card'
  get 'trading_card/:id', to: 'pages#show_card', as: 'trading_card'
  get 'edit_card/:id', to: 'pages#edit_card', as: 'edit_card'
  patch 'update_card/:id', to: 'pages#update_card', as: 'update_card'
  get 'destroy_card/:id', to: 'pages#destroy_card', as: 'destroy_card'


  # Redirect after sign in or sign up
  devise_scope :user do
    authenticated :user do
      root to: 'pages#home', as: :authenticated_root # Redirect to home page if authenticated
    end

    unauthenticated do
      root to: 'pages#login', as: :unauthenticated_root # Redirect to login page if not authenticated
    end
  end

end
