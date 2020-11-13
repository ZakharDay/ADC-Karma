Rails.application.routes.draw do
  resources :minors
  default_url_options host: 'localhost:3000'

  namespace :api do
    resources :services, only: [:index, :show]
  end

  resources :services

  get 'welcome/index'
  root 'minors#index'
end
