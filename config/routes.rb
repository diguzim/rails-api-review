# frozen_string_literal: true

require "sidekiq/web"

# Configure Sidekiq-specific session middleware
Sidekiq::Web.use(ActionDispatch::Cookies)
Sidekiq::Web.use(ActionDispatch::Session::CookieStore, key: "_interslice_session")

Rails.application.routes.draw do
  resources :drops
  resources :items
  resources :creatures
  devise_for :users, defaults: {
    format: :json,
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount Sidekiq::Web => "/sidekiq"
end
