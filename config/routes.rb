BookingVenues::Application.routes.draw do

  post "/clients" => "clients#create"
  get "/clients" => "clients#index"
  get "/clients/:id" => "clients#show"
  get "/clients/new" => "clients#new"
  put "/clients/:id" => "clients#update"
  get "/clients/:id/edit" => "clients#edit"
  put "/clients/:id" => "clients#inactive_client"

  put "/lawns" => "lawns#create"
  get "/lawns" => "lawns#index"
  put "/lawns/:id" => "lawns#update"
  get "/lawns/:id" => "lawns#show"
  get "/lawns/:id/edit" => "lawns#edit"
  put "lawns/:id" => "lawns#update"
  delete "/lawns/:id" => "lawns#destroy"

  post "/halls" => "halls#create"
  get "/halls" => "halls#index"
  put "/halls/:id" => "halls#update"
  get "/halls/:id" => "halls#show"
  get "/halls/:id/edit" => "halls#edit"
  put "halls/:id" => "halls#update"
  delete "/halls/:id" => "halls#destroy"

  get "/listing_views" => "listing_views#index"

  post "/booking" => "bookings#create"
  get "/booking/:id" => "bookings#show"
  get "/booking/:client_id" => "bookings#all_booking_of_client"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
