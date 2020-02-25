Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :babies, only: [ :index, :show, :new, :create, :edit, :update ] do
    resources :memories, only: [ :new, :create ]
  end

  resources :memories, only: [ :show, :edit, :update, :destroy ] do
    resources :comments, only: [ :new, :create ]
  end

  resources :comments, only: [ :edit, :update, :destroy ]
end
