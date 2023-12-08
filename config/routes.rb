# config/routes.rb
Rails.application.routes.draw do
  root 'dashboard#index'

  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  resources :categories, except: [:show] do
    resources :tasks, only: [:create, :destroy, :edit, :update]
    get 'show', on: :member
  end
end
