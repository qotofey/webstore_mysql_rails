# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :users do
    resources :sessions, only: %i[new create destroy]
    resources :confirmations, only: %i[new create]
  end
  resources :users
  resources :user_roles
  resources :categories, param: :slug
  resources :category_fields, only: %i[new create edit update destroy]
end
