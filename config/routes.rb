Rails.application.routes.draw do
  devise_for :volenters, controllers: { registrations: 'volenters/registrations' } 
  resources :associates
  resources :volenters
  resources :centers
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

    # Example of regular route:
  get 'select_center' => 'welcome#select'

  get 'search_center', to: 'welcome#search'

  get 'associate/listing', to: 'associates#listing'

  get '/populate_state_from_selected_country' => 'centers#populate_state_from_selected_country'

  get '/populate_district_from_selected_state' => 'centers#populate_district_from_selected_state'

  get '/populate_sub_district_from_selected_district' => 'centers#populate_sub_district_from_selected_district'

  get '/populate_city_from_selected_sub_district' => 'centers#populate_city_from_selected_sub_district'



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
