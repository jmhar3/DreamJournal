Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :transactions
      resources :notes_categories
      resources :categories
      resources :notes
      resources :goals
      resources :users

      post 'login', to: 'sessions#login'
      post 'signup', to: 'users#create'
      post 'logout', to: 'sessions#logout'
    end
  end
end