Rails.application.routes.draw do
  devise_for :users
  root to: 'studios#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :studios, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :update]
  resources :my_studios

  # for updating confirm requests.
  # patch
end
