Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

  resources :users, only: %i[index show]
  resources :posts, only: %i[create update destroy]
  resources :relationships, only: %i[create destroy]
end
