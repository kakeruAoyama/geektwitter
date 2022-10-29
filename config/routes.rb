Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]   
  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    collection do
      get :day
    end
  end
  root 'hello#index'
end
