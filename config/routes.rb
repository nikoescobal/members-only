# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :secrets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "secrets#index"
end
