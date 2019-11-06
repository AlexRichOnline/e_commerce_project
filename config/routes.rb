# frozen_string_literal: true

Rails.application.routes.draw do
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

  root to: 'items#index'
  # will it blend...
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
