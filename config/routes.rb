Rails.application.routes.draw do
  resources :messages
  resources :users
  resources :politicians
  resources :states
  resources :districts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
