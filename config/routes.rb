Rails.application.routes.draw do
  root 'matches#home'
  devise_for :users
  get 'users/top', to: "users#index", as: 'top'
  
  resources :matches do
    resources :pages
    patch 'blocked', on: :member
  end
end
