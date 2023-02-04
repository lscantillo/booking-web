Rails.application.routes.draw do
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
  devise_for :users
  resources :bookings
  resources :rates
  resources :rooms
  resources :customers
  root "dashboard#index"
end
