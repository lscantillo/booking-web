Rails.application.routes.draw do
  devise_for :users
  resources :bookings
  resources :rates
  resources :rooms
  resources :customers
  root "dashboard#index"
end
