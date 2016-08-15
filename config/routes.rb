Rails.application.routes.draw do

  devise_for :customers

  resources :places
  root to:'places#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
