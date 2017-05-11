Rails.application.routes.draw do
  devise_for :users
 resources :customers do
 resources :tips
end

get 'search' => 'customers#search', as: 'search'
get 'search_results' => 'customers#search_results', as: 'search_results'
 root 'customers#index'
end
