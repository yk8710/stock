Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :posts do
    member do
      get 'search'
    end
  end
  resources :users, only: [:edit, :update]
  resources :memos
  get '/post/category', to: "posts#category"
end
