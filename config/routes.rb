Rails.application.routes.draw do
  resources :raw_bodies
  resources :configs

root to: 'configs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
