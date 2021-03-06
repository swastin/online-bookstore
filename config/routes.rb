Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  get 'categories/new'

  controller :dev_debugger do
    get '/debugger' => 'dev_debugger#index'
  end

  controller :categories do
    post "/categories" => :create
    get "/categories" => :index
  end

  resources :categories

  devise_for :users

  resources :orders

  resources :line_items

  resources :carts, :except => [:index]

  controller :carts do
    get '/cart' => :index
  end
  
  resources :products

  # get "/users"  

  devise_scope :user do
    get "/users" => "users#index"
  end

  scope '(:locale)' do # :locale is in parentheses, which is the way to say that it is optional

    root 'store#index', as: 'store'

  end

  get 'store/index'

  controller :store do
    post "/cn" => :index
    post "/en" => :index
  end

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
