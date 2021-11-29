Rails.application.routes.draw do
  resources :recurring_transactions
  resources :transactions
  resources :notes_categories
  resources :categories
  resources :notes
  resources :goals
  resources :users

  post 'login', to: 'sessions#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end