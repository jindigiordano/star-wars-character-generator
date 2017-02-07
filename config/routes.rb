Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#index"
  resources :users, only: [:index, :new, :create, :show]
  resources :characters, only: [:index, :new, :create, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"


end
