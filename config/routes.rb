Rails.application.routes.draw do
  get 'home/index'
  get 'countries/search'

  resources :worlds, only: %i[index]
  resources :regions, only: %i[index show]
  resources :countries, only: %i[index show search]
  resources :about, only: %i[index]
  root to: 'home#index'
end
