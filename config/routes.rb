Rails.application.routes.draw do
  devise_for :users

  root to:  'stores#index'
  resources :stores, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create]
  end
end
