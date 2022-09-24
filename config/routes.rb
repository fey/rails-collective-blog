Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: %i[new show create]
  resources :post_comments, only: %i[create]
  root to: 'posts#index'
end
