Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  
root 'phone#index'
get 'phones', to: 'phone#index'
post '/phone', to: 'phone#special_number'
post '/phone/:phone', to: 'phone#special_number'
end
