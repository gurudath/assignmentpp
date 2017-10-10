Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'

  resources :contacts
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  # root to: "contacts#index"
  
end
