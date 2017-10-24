Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :update], controller: :profiles
  resource :profile

  resources :photos do
    resources :comments
    # this is a nested route so you can see all the comments per photo
  end

  get 'home/index'
  get '/contact', to: 'static_pages#contact'
  post '/contact', to: 'static_pages#email'
  root 'photos#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
