# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :secrets
  root to: "secrets#index"
end
