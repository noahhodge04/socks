Rails.application.routes.draw do
  # Defines the root path route ("/")
  authenticated :user do
    root "dashboard#welcome", as: :authenticated_root
  end

  unauthenticated do
    root "welcome#index"
  end

  constraints format: :html do
    resources :socks, except: :index do
      resources :matches, only: [ :new, :create ]
      resources :proposals, only: [ :new, :create ]
    end

    resources :proposals, only: [ :update ] do
      resources :accepts, only: :create, module: :proposals
    end

    devise_for :users
  end

  namespace :api, defaults: { format: :json } do
    resources :socks
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
