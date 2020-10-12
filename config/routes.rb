Rails.application.routes.draw do
  get 'about/index'
  get 'home/index'
  root to: "home#index"
end
