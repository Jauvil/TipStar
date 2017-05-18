Rails.application.routes.draw do
  devise_for :users
  resources :customers do
     resources :tips
  end

  get 'search' => 'customers#search', as: 'search'
  get 'search_results' => 'customers#search_results', as: 'search_results'
  root 'customers#index'
  namespace :api, :defaults => { :format => :json } do
     #Create to collection
     post "/customers", to: "customers#create"
     #Read entire collection
     get "/customers", to: "customers#index"
     #Read object from collection
     get "/customers/:id", to: "customers#show"
     #Update object from collection
     put "/customers/:id", to: "customers#update"
     #Delete object from collection
     delete "/customers/:id", to: "customers#destroy"
  end
end
