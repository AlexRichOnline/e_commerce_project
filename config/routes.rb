# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'proceed', to: 'checkout#proceed', as: 'checkout_proceed'
  end

  devise_for :users
  get 'pages/:permalink', to: 'pages#permalink', as: 'permalink'
  get 'pages/about_us', to: 'pages#permalink', as: 'about_us'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :orders, only: %i[index show]
  resources :categories, only: %i[index show]
  resources :items, only: %i[index show] do
    collection do
      get 'search_results'
    end
  end

  post 'items/add_item/:name', to: 'store#add_to_cart', as: 'add_item'
  post 'items/increment_item/:name', to: 'store#increment_item', as: 'increment_item'
  post 'items/decrement_item/:name', to: 'store#decrement_item', as: 'decrement_item'
  delete 'items/remove_from_cart/:name', to: 'store#remove_from_cart', as: 'remove_item'

  root to: 'items#index'
  # will it blend...
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
