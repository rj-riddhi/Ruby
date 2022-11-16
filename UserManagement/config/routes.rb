Rails.application.routes.draw do
  devise_for :users
  resources :user_lists
  
  # resources :friends
  get 'home/index'
  root to: 'home#index'
  get 'home/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
