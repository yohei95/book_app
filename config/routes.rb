Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'
  get :about, to: 'static_pages#about'

  resources :users, only: [:index,:show,:edit ,:update,:destroy]
  resources :posts do
    resources :comments
  end
end