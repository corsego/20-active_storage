Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root "dashboard#index"
  get 'dashboard/index'
end
