Rails.application.routes.draw do
  devise_for :users
  resources :mystores
  root 'mystores#index'
end
