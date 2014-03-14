StackOflow::Application.routes.draw do
  # You can have the root of your site routed with "root"
  devise_for :users
  root 'welcome#index'
      resources :comments
  resources :questions do
    resources :answers
  end

  match "search", to: "questions#search", via: :post

  match "/votes/question/upvote/:id",   to: "questions#create_up_vote",   via: :get, as: "new_question_upvote"
  match "/votes/question/downvote/:id", to: "questions#create_down_vote", via: :get, as: "new_question_downvote"

  match "/votes/answer/upvote/:id",   to: "answers#create_up_vote",   via: :get, as: "new_answer_upvote"
  match "/votes/answer/downvote/:id", to: "answers#create_down_vote", via: :get, as: "new_answer_downvote"
  match "/top_users", to: "welcome#top_users", via: :get, as: "top_users"
  match "/user", to: "welcome#user", via: :get, as: "user"

  match "/questions/:question_id/mark_as_best/:answer_id", to: "questions#mark_as_best", via: :get, as: "mark_as_best"

  resources :votes
  # The priority is based upon order of creation: first created -> highest priority.
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
