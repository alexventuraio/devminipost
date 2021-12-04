Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  put "/subscriptions", to: "subscriptions#update"

  resources :competitions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
