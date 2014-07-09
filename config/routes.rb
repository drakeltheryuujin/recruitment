Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :gallery_items
  resources :users, only: :show
end

