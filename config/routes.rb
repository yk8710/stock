Rails.application.routes.draw do
  devise_for :users
  get 'top/index'
  root to: "top#index"
end
