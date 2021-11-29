Rails.application.routes.draw do
  resources :transactions
  resources :notes_categories
  resources :categories
  resources :notes
  resources :goals
  resources :users

  post 'login', to: 'sessions#login'
  post 'signup', to: 'users#create'

  get '/auth/facebook/callback' => 'sessions#fb_login'
end