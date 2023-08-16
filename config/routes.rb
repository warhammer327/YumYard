Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :food, only:[:index, :create, :show, :edit, :destroy]
      resources :coupon, only:[:index, :show, :create, :update, :destroy]
      resources :order, only:[:index, :show, :create, :update, :destroy]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
