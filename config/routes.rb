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
resources :carts, only: [:create, :show, :destroy, :update]
resources :payments, only: [:new, :create, :show, :index, :update]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
