Rails.application.routes.draw do
  resources :posts do
    member do
      delete :purge_avatar
    end
  end
  
  devise_for :users
  root "dashboard#index"
  get 'dashboard/index'
end
