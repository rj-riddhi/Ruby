Rails.application.routes.draw do
  namespace :api do
    get 'typeahead/show'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do 
    resources :users
    get '/typeahead/:input', to: 'typeahead#show'
  end
end
