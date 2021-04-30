# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :secrets, only: [:new, :create, :index]
  root to: "secrets#index"
end
