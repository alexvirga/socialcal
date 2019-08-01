Rails.application.routes.draw do
  root "home#index"
  get "/users/:id/groups", to: "users#joingroup"
  get "/users/:id/events", to: "users#joinevent_create"

  get "/login", to: "sessions#new", as: "login"
  get "/signup", to: "users#new", as: "signup"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  post "/usergroups/new", to: "usergroups#create"
  post "/users/:id/joingroup", to: "users#joingroup_create"
  post "//groups/:id/message", to: "groups#add_message"
  delete "/groups/usergroups/:id", to: "usergroups#destroy"

  post "/users/joinevent/:id", to: "users#joinevent_create"

  resources :users, :groups, :events, :usergroups, :userevents

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
