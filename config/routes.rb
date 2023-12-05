Rails.application.routes.draw do
  root 'dashboard#index'  # Set the dashboard as the root page after login
  # Other routes...

  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories
end
