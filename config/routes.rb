Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
    resources :cabans, only: [:index, :show, :new, :create] do
      resources :bookings, only: [:new, :create]
  end
  get "dashboard", to: "pages#dashboard"
end
