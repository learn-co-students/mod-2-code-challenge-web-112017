Rails.application.routes.draw do
  resources :superpowers, only: [:index]
  resources :superheroes, only: [:index, :show, :new]

  get "/superheros/:id", to: "superhero#show", as: "superheroes_path"
  get "/superpowers/:id", to: "superpower#show", as: "superpowers_path"
end
