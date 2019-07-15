Rails.application.routes.draw do
  

  get 'welcome/index'
  get "concierto", to: "welcome#index"
  root 'welcome#index'
  get "seats", to: "seat#index"
  get "reservations", to: "reservations#index"
  
  devise_for :users
  
  get 'users/sign_in'
  get 'seat/new'
  get "buscardisponibles", to: "seat#buscardisponibles"
  
  resources :reservations
end
