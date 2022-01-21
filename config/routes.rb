Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'items#home'
  get 'items', to: 'items#list'
  get 'price', to: 'items#price'
  post 'price', to: 'items#total'
  resources :items, only: [:edit, :update]

end
