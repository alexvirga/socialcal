Rails.application.routes.draw do
  root "home#index"

  get "/login", to: "sessions#new", as: "login"
  get "/signup", to: "users#new", as: "signup"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  resources :users, :groups, :events, :usergroups

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
