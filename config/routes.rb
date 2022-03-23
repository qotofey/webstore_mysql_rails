# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  namespace :users do
    resources :sessions, only: %i[new create destroy]
  end
  resources :users do
    resources :confirmations, only: %i[new create], controller: 'phone_confirmations'
  end
  resources :user_roles
  resources :categories, param: :slug
  resources :category_fields, only: %i[new create edit update destroy]
end
