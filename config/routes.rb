Rails.application.routes.draw do
  root to: 'restaurants#index'
  resources :restaurants do
    resources :reviews, only: [:new, :create]
    collection do
      get :top
    end
    member do
      get :chef
    end
  end
  resources :reviews, only: [:destroy]
end

# collection -> all of the restaurants
# member -> one specific restaurant
