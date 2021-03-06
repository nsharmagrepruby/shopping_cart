Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  root 'welcome#index'
  
  resources :users, except: [:index, :destroy]
  resources :products, only: [:index, :new, :show, :create]
  resources :carts, only: [:new, :create, :show]
  resources :cart_products, only: [:edit, :destroy, :show]
  resources :orders, only: [:index, :show, :create]
  resources :addresses, except: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'shops/products', to: 'shops#products'
end
