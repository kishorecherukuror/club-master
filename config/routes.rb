Rails.application.routes.draw do
  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount RailsAdmin::Engine => 'club/admin', as: 'rails_admin'
  mount Piggybak::Engine => '/club/checkout', as: :piggybak
  
  get 'punchqueries/new'
  resources :club do
	get 'send_gift'
	get 'show_gift'
	get 'show_product_reviews'
  end
  resources :product_reviews
  get 'punchqueries/create'
  post 'punchqueries/create'

  devise_for :users, :controllers => { registrations: 'registrations' } 
#  get 'club/index''
  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'club#index'

   get "/about" => "club#about"
   get "/why_club" => "club#way_club"
   get "/about" => "club#about"
   get "/about" => "club#about"
   get "/about" => "club#about"
   get "/about" => "club#about"
   get "/about" => "club#about"
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
