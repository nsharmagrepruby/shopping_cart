Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  root 'welcome#index'
  
  resources :users, only: [:create, :new, :edit, :show, :update] do
    resources :addresses, only: [:index, :new, :create, :update, :destroy, :edit]
    resources :products, only: [:index, :new, :show, :create]
    resources :carts, only: [:new, :create, :edit, :show]
    resources :cart_products, only: [:edit, :destroy]
    resources :orders, only: [:index, :show, :create]
  end
  resources :sessions, only: [:new, :create, :destroy]
end
