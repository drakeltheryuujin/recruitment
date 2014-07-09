Rails.application.routes.draw do
  devise_for :users
  root 'gallery_items#index'
  resources :gallery_items
  resources :users, only: :show
end

