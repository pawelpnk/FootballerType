Rails.application.routes.draw do
  root 'match#home'
  devise_for :users

  get '/match', to: 'match#new'
  post '/match', to: 'match#create'

  get '/match/:id', to: "match#edit", as: 'match_edit'
  patch "/match/:id", to: 'match#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
