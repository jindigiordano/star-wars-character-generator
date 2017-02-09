Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#index"
  resources :users, only: [:index, :new, :create, :show]
  resources :characters, only: [:index, :new, :create, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/characters/:id/delete' => 'characters#destroy'


end
