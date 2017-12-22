Rails.application.routes.draw do
  resources :superpowers, only: [:show]
  resources :superheroes, only: [:index, :show, :new, :create]
  get '/', to: 'superheroes#index', as: 'root'
end
