Rails.application.routes.draw do
  resources :bookings
  resources :rates
  resources :rooms
  resources :customers
  root "dashboard#index"
end
