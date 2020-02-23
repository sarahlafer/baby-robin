Rails.application.routes.draw do
  get 'memories/show'
  get 'memories/new'
  get 'memories/create'
  get 'memories/edit'
  get 'memories/update'
  get 'memories/delete'
  devise_for :users
  root to: 'pages#home'

  resources :babies, only: [ :index, :show, :new, :create ] do
    resources :memories, only: [ :new, :create ]
  end

  resources :memories, only: [ :show, :edit, :update, :delete ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
