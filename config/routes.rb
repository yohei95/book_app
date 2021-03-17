Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'static_pages#home'
  get :about,        to: 'static_pages#about'
  get :use_of_terms, to: 'static_pages#terms'
  resources :users, only: :show
 end