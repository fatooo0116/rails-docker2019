Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"


  get '/json_works/', to: 'works#json_works'
  get '/cals/customers/', to: 'cals#customers'

  resources :myadmin
  resources :works
  resources :cals
end
