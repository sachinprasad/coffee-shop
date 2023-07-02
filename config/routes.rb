Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  namespace :admin do
    resources :items
    resources :orders do
       member do
         post :update_order_status
       end
    end
    resources :offers
  end
  resources :orders
end
