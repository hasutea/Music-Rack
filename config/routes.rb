# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#          new_user_session GET    /users/sign_in(.:format)                                                                 users/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 users/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                users/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            users/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           users/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                users/passwords#update
#                           PUT    /users/password(.:format)                                                                users/passwords#update
#                           POST   /users/password(.:format)                                                                users/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  users/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 users/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    users/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         users/registrations#update
#                           PUT    /users(.:format)                                                                         users/registrations#update
#                           DELETE /users(.:format)                                                                         users/registrations#destroy
#                           POST   /users(.:format)                                                                         users/registrations#create
#         new_admin_session GET    /admins/sign_in(.:format)                                                                admins/sessions#new
#             admin_session POST   /admins/sign_in(.:format)                                                                admins/sessions#create
#     destroy_admin_session DELETE /admins/sign_out(.:format)                                                               admins/sessions#destroy
#        new_admin_password GET    /admins/password/new(.:format)                                                           admins/passwords#new
#       edit_admin_password GET    /admins/password/edit(.:format)                                                          admins/passwords#edit
#            admin_password PATCH  /admins/password(.:format)                                                               admins/passwords#update
#                           PUT    /admins/password(.:format)                                                               admins/passwords#update
#                           POST   /admins/password(.:format)                                                               admins/passwords#create
# cancel_admin_registration GET    /admins/cancel(.:format)                                                                 admins/registrations#cancel
#    new_admin_registration GET    /admins/sign_up(.:format)                                                                admins/registrations#new
#   edit_admin_registration GET    /admins/edit(.:format)                                                                   admins/registrations#edit
#        admin_registration PATCH  /admins(.:format)                                                                        admins/registrations#update
#                           PUT    /admins(.:format)                                                                        admins/registrations#update
#                           DELETE /admins(.:format)                                                                        admins/registrations#destroy
#                           POST   /admins(.:format)                                                                        admins/registrations#create
#                  products GET    /products(.:format)                                                                      products#index
#                           POST   /products(.:format)                                                                      products#create
#               new_product GET    /products/new(.:format)                                                                  products#new
#              edit_product GET    /products/:id/edit(.:format)                                                             products#edit
#                   product GET    /products/:id(.:format)                                                                  products#show
#                           PATCH  /products/:id(.:format)                                                                  products#update
#                           PUT    /products/:id(.:format)                                                                  products#update
#                           DELETE /products/:id(.:format)                                                                  products#destroy
#                     users GET    /users(.:format)                                                                         users#index
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#                     carts POST   /carts(.:format)                                                                         carts#create
#                      cart GET    /carts/:id(.:format)                                                                     carts#show
#                           PATCH  /carts/:id(.:format)                                                                     carts#update
#                           PUT    /carts/:id(.:format)                                                                     carts#update
#                           DELETE /carts/:id(.:format)                                                                     carts#destroy
#                  payments GET    /payments(.:format)                                                                      payments#index
#                           POST   /payments(.:format)                                                                      payments#create
#               new_payment GET    /payments/new(.:format)                                                                  payments#new
#                   payment GET    /payments/:id(.:format)                                                                  payments#show
#                           PATCH  /payments/:id(.:format)                                                                  payments#update
#                           PUT    /payments/:id(.:format)                                                                  payments#update
#           admins_products GET    /admins/products(.:format)                                                               admins/products#index
#                           POST   /admins/products(.:format)                                                               admins/products#create
#        new_admins_product GET    /admins/products/new(.:format)                                                           admins/products#new
#       edit_admins_product GET    /admins/products/:id/edit(.:format)                                                      admins/products#edit
#            admins_product GET    /admins/products/:id(.:format)                                                           admins/products#show
#                           PATCH  /admins/products/:id(.:format)                                                           admins/products#update
#                           PUT    /admins/products/:id(.:format)                                                           admins/products#update
#                           DELETE /admins/products/:id(.:format)                                                           admins/products#destroy
#              admins_users GET    /admins/users(.:format)                                                                  admins/users#index
#          edit_admins_user GET    /admins/users/:id/edit(.:format)                                                         admins/users#edit
#               admins_user GET    /admins/users/:id(.:format)                                                              admins/users#show
#                           PATCH  /admins/users/:id(.:format)                                                              admins/users#update
#                           PUT    /admins/users/:id(.:format)                                                              admins/users#update
#                           DELETE /admins/users/:id(.:format)                                                              admins/users#destroy
#           admins_payments GET    /admins/payments(.:format)                                                               admins/payments#index
#            admins_payment PATCH  /admins/payments/:id(.:format)                                                           admins/payments#update
#                           PUT    /admins/payments/:id(.:format)                                                           admins/payments#update
#                refile_app        /attachments                                                                             #<Refile::App app_file="/home/vagrant/.bundle/ruby/2.5.0/refile-46b4178654e6/lib/refile/app.rb">
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do

root 'products#index'

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

resources :products, only: [:index, :show]
resources :users, only: [:index, :show, :edit, :update, :destroy]
get "/users/:id/carts" => "users#cart", as: "user_cart"
resources :carts, only: [:create, :destroy, :update]
resources :payments, only: [:new, :index, :create, :show, :update]
match '/finish', to: 'payments#finish', via: 'get'

namespace :admins do
  resources :products, only: [:index, :show, :edit, :new, :create, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :payments, only: [:index, :show, :update]
  resources :artist, only: [:index, :create, :destroy]
  resources :label, only: [:index, :create, :destroy]
  resources :genre, only: [:index, :create, :destroy]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
