Rails.application.routes.draw do
  devise_for :user1s
  get 'checkout' => 'checkout#index' , as: :checkout
  # get 'add/new'
  post 'order/store' => 'checkout#final_store'
  post 'order/ship' => 'checkout#final_ship' , as: :final_shipping
  get 'stores' => 'checkout#stores', as: :store_address
  get 'shipping' => 'checkout#ship', as: :shipping
  post 'checkout/update' => 'checkout#update', as: :update_address
  post 'add/new' => 'checkout#new'
  get 'mycart' => 'checkout#show', as: :mycart
  resources :users
  get 'profile' => 'users#profile', as: :profile
  get 'orders' => 'users#orders', as: :orders
  resources :sessions, only:[:new, :create, :destroy]

  root 'product#index'

  get 'product' => 'product#index'
  get 'product/:id' => 'product#show'
  
  get 'product/buy/:id' => 'product#buy'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/remove', to: 'checkout#destroy', via: 'delete'
  match '/removefinal', to: 'checkout#destroyfinal', via: 'delete'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
