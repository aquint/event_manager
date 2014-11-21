EventManager::Application.routes.draw do
  devise_for :users

  root 'home#index'
  resources :users
  resources :events do

  	resources :invitations

  end
  resources :memberships,       only: [:create, :destroy]
  
end
