Rails.application.routes.draw do
  resources :messages
  resources :users
  resources :politicians

  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  root to: 'sessions#new'
  get '/register' => 'users#new', as: '/register'
end
