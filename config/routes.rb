Rails.application.routes.draw do
  resources :genres
  resources :purchases
  resources :books
  resources :users
  root 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
