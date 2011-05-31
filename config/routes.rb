#RfpManager::Application.routes.draw do
ActionController::Routing::Routes.draw do |map|
  
  root :to => 'projects#index'
  
  map.resources :sessions, :only => [:new, :create, :destroy]
  map.resources :businesses, :only => [:index]
  

  map.resources :projects
  map.resources :users
  map.resources :components
  map.resources :pcomponents
  map.resources :questions
  map.resources :requirements
  map.resources :prequirements 
  map.resources :pquestions, :member => {:rate => :post}
  

  match '/signup', :to => "users#new"
  match '/signin', :to => "sessions#new"
  match '/signout', :to => "sessions#destroy"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-map.resources:
  #   map.resources :products do
  #     map.resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-map.resources
  #   map.resources :products do
  #     map.resources :comments
  #     map.resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     map.resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "projects#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
