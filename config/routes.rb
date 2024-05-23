Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Devise routes for User authentication
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  # Routes for Logging in (also set root to the login itself)
  root to: 'pages#login'
  get 'login', to: 'pages#login'
  get 'sign_up', to: 'pages#create'
  get 'home', to: 'pages#home'

  get "up" => "rails/health#show", as: :rails_health_check

  # Redirect after sign in or sign up
  devise_scope :user do
    authenticated :user do
      root to: 'pages#home', as: :authenticated_root
    end

    unauthenticated do
      root to: 'pages#login', as: :unauthenticated_root
    end
  end

end
