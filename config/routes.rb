Rails.application.routes.draw do
  resources :superpowers, only: [:index, :new, :create, :show]
  resources :superheroes, only: [:index, :new, :create, :show]

end
