Rails.application.routes.draw do
  root to: "rides#index"
  devise_for :users
  resources :rides
  resources :users, only: [:index, :show]
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
