Rails.application.routes.draw do
  resources :polls

  root 'static_pages#home'
  get  '/home', to: 'static_pages#home'

  devise_for :users
end
