Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
    resources :cabans do
      resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :update] do
    member do
      get :accept, to: "bookings#accept"
      get :refuse, to: "bookings#refuse"
      delete :destroy, to: "bookings#destroy", as: :destroy
    end
  end

  get "dashboard", to: "pages#dashboard"
end
