Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

  resources :users, only: %i[index show], shallow: true do
    resources :relationships, only: [], path: '' do
      member do
        post :toggle_follow
      end
      collection do
        get :followers
        get :followees
      end
    end
  end

  resources :posts, only: %i[create destroy]
end
