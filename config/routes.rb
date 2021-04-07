Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'
  post '/static_pages/guest_sign_in', to:'static_pages#new_guest'
  get '/completion', to:'completions#index'

  resources :users, only: [:index,:show,:edit ,:update,:destroy] 
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :posts do
    resources :comments
    resource  :likes, only: [:create, :destroy]
    resource  :completions, only: [:create, :destroy]
  end

  # resources :completions
  # post 'completion/:id' => 'completions#create', as: 'create_completion'
  # delete 'completion/:id' => 'completions#destroy', as: 'destroy_completion'

end