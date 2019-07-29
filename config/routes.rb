Rails.application.routes.draw do

root "home#index"

get 'home/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
get "/login", to: "users#login"

resources :users, :groups, :events


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
