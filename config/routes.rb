Dailyapp::Application.routes.draw do


  #resources :meals


  resources :portions


  resources :foods


  resources :ingredients


  resources :recipes


  resources :products


  devise_for :users, path: 'accounts'

  resources :users do
    resources :daily_food_records do
      resources :meals
    end
  end

  get "home/index"

  root to: 'home#index'

end
