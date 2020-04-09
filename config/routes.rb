Rails.application.routes.draw do
  devise_for :users
  root to: 'items#show'
  resources :items
  resources :users
end


