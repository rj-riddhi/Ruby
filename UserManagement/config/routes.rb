Rails.application.routes.draw do
  
  resources :user_lists
  
  devise_for :users
  # resources :friends
  get 'home/index'
  root 'home#index'
  get 'home/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
