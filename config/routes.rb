Rails.application.routes.draw do
  resources :superpowers, only: [:index, :show]
  resources :superheroes, only: [:index, :show ] #:new, :create
  #try to add path for create as some alias/variable
  get "/superheroes/new", to: "superheroes#new"
  #get "/search", to: "superheros#searchpower"
end
