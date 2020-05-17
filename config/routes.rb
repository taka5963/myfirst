Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :users, only: [:edit, :update]
  resources :posts, only: [:index, :new, :create] do
    resources :comments, only: [:index, :new, :create]
  end
end
