EventManager::Application.routes.draw do
  devise_for :users

  root 'home#index'
  resources :users
  resources :events
  
end
