Rails.application.routes.draw do
  resources :posts
  root "blogs#index"
  
  resource :admin, only: [:show, :create, :destroy]

  resources :blogs
end
