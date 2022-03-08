# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :categories, param: :slug
  resources :category_fields, only: %i[new create edit update destroy]
end
