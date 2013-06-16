Dailyapp::Application.routes.draw do
  resources :daily_food_records


  resources :meals


  resources :portions


  resources :foods


  resources :ingredients


  resources :recipes


  resources :products


  devise_for :users

  get "home/index"

  root to: 'home#index'

end
