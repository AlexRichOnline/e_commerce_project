# frozen_string_literal: true

Rails.application.routes.draw do
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
