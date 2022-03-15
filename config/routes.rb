Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/home', to: 'static_pages#home'

  devise_for :users, :path => 'accounts'
  devise_scope :user do
    get 'accounts/sign_out' => 'devise/sessions#destroy'
  end

  resources :users do
    resources :votes, only: [:create, :destroy, :index]
    resources :polls
  end
  resources :polls, only: [:index, :show]
end
