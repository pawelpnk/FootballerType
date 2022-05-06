Rails.application.routes.draw do
  root 'matches#home'
  devise_for :users
  
  resources :matches do
    resources :pages
    get 'blocked', on: :member
    # , as: 'blocked' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
