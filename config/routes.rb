Rails.application.routes.draw do
  resources :superpowers, only: [:index, :show]
  resources :superheroes, only: [:index, :show, :new, :create]
  # resources :superheroes do
  #    collection do
  #     get :search
  #   end
  # end


end
