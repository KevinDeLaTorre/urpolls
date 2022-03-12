Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/home', to: 'static_pages#home'

  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  resources :polls
end
