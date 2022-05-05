Rails.application.routes.draw do
  root 'matches#home'
  devise_for :users

  # get '/match', to: 'match#new'
  # post '/match', to: 'match#create'

  # get '/match/:id', to: "match#edit", as: 'match_edit'
  # patch "/match/:id", to: 'match#update', as: 'match_update'

  resources :matches do
    resources :pages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
