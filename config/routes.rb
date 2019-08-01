Rails.application.routes.draw do
  root "home#index"
  get "/users/:id/groups", to: "users#joingroup"

  get "/login", to: "sessions#new", as: "login"
  get "/signup", to: "users#new", as: "signup"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  post "/usergroups/new", to: "usergroups#create"
  post "/users/:id/joingroup", to: "users#joingroup_create"
  delete "/groups/usergroups/:id", to: "usergroups#destroy"

  resources :users, :groups, :events, :usergroups, :userevents

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
