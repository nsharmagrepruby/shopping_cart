Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  root 'welcome#index'
 
  resources :users, only: [:create, :new, :edit, :show, :update, :destroy] do
    resources :addresses
  end
  resources :sessions, only: [:new, :create, :destroy]
end
