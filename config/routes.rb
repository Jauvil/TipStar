Rails.application.routes.draw do
  devise_for :users
 resources :customers do
 resources :tips
end
 root 'customers#index'
end
