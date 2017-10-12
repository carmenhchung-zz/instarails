Rails.application.routes.draw do
  resources :photos do
  resources :comments
  # this is a nested route so you can see all the comments per photo
end
  devise_for :users
  root to: 'photos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
