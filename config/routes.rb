Rails.application.routes.draw do
  devise_for :users
  root to: 'items#new'
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users
end


