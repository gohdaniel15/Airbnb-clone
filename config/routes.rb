Rails.application.routes.draw do

  get 'payments/new'
  resources :payments, only: [:new, :create]

# Listings & Reservations
    resources :listings, only: [:index, :show, :new, :edit, :update] do
      resources :reservations, only: [:index, :show, :new, :edit, :update]
    end
    post "/listings" => "listings#create", as: "listings_create"
    post "/listings/:listing_id/reservations" => "reservations#create", as: "reservations_create"
    get "/search" => "listings#search", as: "listings_search"
# Listings & Reservations end

# User accounts
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
    resources :users, controller: "clearance/users", only: [:create] do
      resource :password,
        controller: "clearance/passwords",
        only: [:create, :edit, :update]
    end
    get "/sign_in" => "clearance/sessions#new", as: "sign_in"
    delete "/sign_out" => "sessions#destroy", as: "sign_out"
    get "/sign_up" => "clearance/users#new", as: "sign_up"
# Facebook Authentication
    resources :users, only: [:show, :edit, :update, :destroy]
    get "/auth/:provider/callback" => "sessions#create_from_omniauth", as: "facebook"
# User accounts end

# Root page
    root 'listings#index'
# Root page end


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
