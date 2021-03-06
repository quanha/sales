Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'

  get 'new_arrivals' => 'pages#new_arrivals'
  get 'sales' => 'pages#sales'
  get 'accessories' => 'pages#accessories'
  get 'contact' => 'pages#contact'
  get 'about_us' => 'pages#about_us'
  get 'product/:id' => 'pages#product', as: :product
  get 'pages/cart' => 'pages#cart', as: :cart
  get 'pages/checkout' => 'pages#checkout', :as => :checkout
  get 'pages/order_success' => 'pages#order_success', :as => :order_success
  get 'collections/:category_id/:product_type_id' => 'pages#collections', :as => :collections
  post 'pages/get_store_quantity' => 'pages#get_store_quantity', :as => :ajax_get_store_quantity
  post 'pages/add_to_cart' => 'pages#add_to_cart', :as => :ajax_add_to_cart
  post 'pages/remove_product' => 'pages#remove_product', :as => :ajax_remove_product
  post 'pages/select_quantity' => 'pages#select_quantity', :as => :ajax_select_quantity
  post 'pages/save_order' => 'pages#save_order', :as => :save_order

  namespace :admin do
    root 'users#index'
    post '/backend_menus/ajax_update_position' => 'backend_menus#ajax_update_position'
    post '/menus/ajax_update_position' => 'menus#ajax_update_position'
    post '/products/delete_image' => 'products#delete_image'

    resources :orders
    resources :users
    resources :products
    resources :suppliers
    resources :categories
    resources :backend_menus
    resources :slides
    resources :stores
    resources :pages
    resources :menus
    resources :product_types
  end

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
