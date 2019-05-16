Rails.application.routes.draw do



devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
}

devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
}

resources :products
resources :users, only: [:index, :show, :edit, :update, :destroy]
resources :carts, only: [:create, :show, :destroy, :update]
resources :payments, only: [:new, :create, :show, :index, :update]

namespace :admins do
  resources :products, only: [:index, :show, :edit, :new, :create, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :payments, only: [:index, :update]
end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
