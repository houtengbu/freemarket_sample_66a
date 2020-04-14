Rails.application.routes.draw do
  devise_for :users
  root to: 'items#new'
  resources :items
  resources :users
end


