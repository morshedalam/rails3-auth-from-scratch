Rails3AuthFromScratch::Application.routes.draw do
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  get 'signup' => 'users#new', :as => 'signup'
  post 'sessions' => 'sessions#create'

  root :to => 'home#index'
end
