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

      get '/auth/facebook/callback' => 'sessions#fb_login'
    end
  end
end