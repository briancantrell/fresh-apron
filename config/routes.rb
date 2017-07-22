Rails.application.routes.draw do
  resources :recipes
  resources :ingredients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages/home", controller: :pages, action: :home
  resources :schedules, only: [:show, :create]
  resources :meals
end
