# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'pages/:permalink', to: 'pages#permalink', as: 'permalink'
  get 'pages/about_us', to: 'pages#permalink', as: 'about_us'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :categories, only: %i[index show]
  resources :items, only: %i[index show] do
    collection do
      get 'search_results'
    end
  end

  post 'add_item/:name', to: 'store#add_item_to_cart', as: 'add_item'

  root to: 'items#index'
  # will it blend...
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
