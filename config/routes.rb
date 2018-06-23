Rails.application.routes.draw do
  get 'rooms/my_rooms'
  get 'bookings/my_bookings'
  resources :amenities
  devise_for :users
  resources :cities
  resources :roles
  resources :images
  resources :rooms
  resources :bookings
  scope "/admin" do
     resources :users
  end

  root 'rooms#index'
end
