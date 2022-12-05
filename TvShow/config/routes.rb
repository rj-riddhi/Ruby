Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  get 'welcome/index'
  resources :tv_shows do
    member do
      post :add_to_favorites
      delete :remove_from_favorites
    end
  end
  root to: 'welcome#index'
end
