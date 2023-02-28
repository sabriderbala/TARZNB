Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cabans, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :update] do
    member do
      get :accept, to: "bookings#accept"
      get :refuse, to: "bookings#refuse"
    end
  end

  get "dashboard", to: "pages#dashboard"
end
