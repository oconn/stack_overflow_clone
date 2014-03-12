StackOflow::Application.routes.draw do
  # You can have the root of your site routed with "root"
  devise_for :users
  root 'welcome#index'

  resources :comments


  resources :questions do
    resources :answers
  end

  resources :votes
  match 'comments', to: 'comment#index',   via: :get
  match 'comments', to: 'comment#create',  via: :post
  match 'comments', to: 'comment#new',     via: :get
  match 'comments', to: 'comment#edit',    via: :get
  match 'comments', to: 'comment#show',    via: :get
  match 'comments', to: 'comment#update',  via: :patch
  match 'comments', to: 'comment#update',  via: :put
  match 'comments', to: 'comment#destroy', via: :delete







# comments             GET    /comments(.:format)                                comments#index
#                      POST   /comments(.:format)                                comments#create
#          new_comment GET    /comments/new(.:format)                            comments#new
#         edit_comment GET    /comments/:id/edit(.:format)                       comments#edit
#              comment GET    /comments/:id(.:format)                            comments#show
#                      PATCH  /comments/:id(.:format)                            comments#update
#                      PUT    /comments/:id(.:format)                            comments#update
#                      DELETE /comments/:id(.:format)                            comments#destroy
#   # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".



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
