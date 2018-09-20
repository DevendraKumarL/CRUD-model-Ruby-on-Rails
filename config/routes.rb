Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes"
  get 'register_login/index'

  get 'register/new_user' => 'register_login#new_user'
  post 'register/create_user' => 'register_login#create_user'

  get 'login/login_user' => 'register_login#login_user'
  post 'login/user_authentication' => 'register_login#user_authentication'

  get 'register_login/logout_user' => 'register_login#destroy'

  get 'upload/info/:id' => 'upload_info#upload_form', as: :uploadThisUserData
  post 'upload/submit_info' => 'upload_info#save_data'

  get 'view/info/:id' => 'upload_info#view_data', as: :viewThisUserData
  get 'edit/info/:id' => 'upload_info#edit_data', as: :editThisData
  get 'delete/info/:id' => 'upload_info#delete_data', as: :deleteThisData
  post 'edit/info/update' => 'upload_info#update_data'

  get 'products/page' => 'products_page#index'
  get 'products/tag_find' => 'products_page#tag_find'
  get 'products/each_product/:id' => 'products_page#each_product', as: :product
  get 'products/view_all' => 'products_page#view_all'

  # You can have the root of your site routed with "root"
  # root 'register_login#index'
  root 'crud#index'

  # resources :persons

  # index page / view all
  get 'crud/person/index' => 'crud#index', as: :crud_index
  #  create new person
  get 'crud/person/new' => 'crud#new', as: :crud_new
  post 'crud/person' => 'crud#create', as: :people
  # view a person
  get 'crud/person/:id' => 'crud#view', as: :crud_view
  # update a person
  get 'crud/person/edit/:id' => 'crud#edit', as: :crud_edit
  patch 'crud/person/:id' => 'crud#update', as: :person
  #delete a person
  delete 'crud/person/:id' => 'crud#destroy'

  resources :schools do
    resources :students
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
