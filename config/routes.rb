Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :posts, except: :index
  root 'home#index'
  get 'info', to: 'home#contacts', as: :contacts

  get '/posts(/page/:page)', to: 'posts#index'
  get '/usrs(/user/:page)', to: 'users#index'

 # get '/home(/:hello)', to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
