Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  root 'welcome#index'
  
  resources :users, only: [:create, :new, :edit, :show, :update] do
    resources :addresses, only: [:index, :new, :create, :update, :destroy, :edit]
    resources :products, only: [:index, :new, :show, :create]
    resources :carts, only: [:index, :new, :create, :edit]
  end
  resources :sessions, only: [:new, :create, :destroy]
end
