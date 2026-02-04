Rails.application.routes.draw do
  get "pages/home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # Authentication
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # OmniAuth Callbacks
  match "/auth/:provider/callback", to: "omniauth_callbacks#handle_auth", via: [ :get, :post ]
  get "/auth/failure", to: redirect("/login")

  # Dashboard & Payments
  resource :dashboard, only: [ :show ], controller: "dashboards"
  resources :payments, only: [ :index, :new ]

  # Root path
  root "pages#home"
end
