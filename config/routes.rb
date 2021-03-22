Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'
  post '/static_pages/guest_sign_in', to:'static_pages#new_guest'
  get :about, to: 'static_pages#about'

  resources :users, only: [:index,:show,:edit ,:update,:destroy] 
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :posts do
    resources :comments
    resources :completions, only: [:create, :destroy]
  end

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end