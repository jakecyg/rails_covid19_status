Rails.application.routes.draw do
  get 'worlds/index'
  get 'countries/index'
  get 'countries/show'
  get 'countries/search'
  get 'regions/index'
  get 'regions/show'
  get 'regiones/index'
  get 'regiones/show'
  get 'about/index'
  get 'home/index'
  root to: "home#index"
end
