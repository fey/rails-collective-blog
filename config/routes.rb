# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:new, :show, :create]
  root to: 'posts#index'
end
