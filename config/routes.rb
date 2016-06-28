Rails.application.routes.draw do
  resources :cart_items, only: [:new, :create]

  resource :cart, only: [:show]
  post 'cart/check_out', to: 'carts#check_out'

  resources :products, only: [:index, :new, :create]

  devise_for :users
  resources :users

  root to: 'visitors#index'
end
