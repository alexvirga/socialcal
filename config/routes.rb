Rails.application.routes.draw do
  root "home#index"

  get "/login", to: "sessions#new", as: "login"
  get "/signup", to: "users#new", as: "signup"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"
  get "/users/:id/groups", to: "users#joingroup"
  # post "/users/:id/groups", to: "users#createusergroup"

  post "/usergroups/new", to: "usergroups#create"
  post "/users/:id/joingroup", to: "users#joingroup_create"

  resources :users, :groups, :events, :usergroups

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
