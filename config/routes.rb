Rails.application.routes.draw do
  resources :users, only: [:none] do
    resources :password_resets, only: [:edit, :update]
    resource :profile, only: [:edit, :update]
  end
  resources :password_resets, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  root "pages/home", controller: :pages, action: :home

  # require login for routes below
  resources :recipes
  resources :ingredients
  resources :schedules, only: [:index, :create]
  resources :meals
end
