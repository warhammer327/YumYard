Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :food, only:[:index, :create, :show]
      resources :coupon, only:[:index, :show, :create, :update, :destroy]
      resources :order, only:[:index, :show, :create, :update, :destroy] do
        member do
          post 'process_order', to: 'order#process_order'
        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
