# frozen_string_literal: true

Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  resources :posts, only: %i[new show create]
  resources :post_comments, only: %i[create]
  resources :post_likes, only: %i[create destroy]
  root to: 'posts#index'
end
