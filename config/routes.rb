Rails.application.routes.draw do

  root 'home#index'

  resources :movies

  get 'more_movies', to: 'movies#more_movies', as: :more_movies

  resources :sessions, only: [:new, :create]

  resources :users

  get 'user_top_posts', to: 'users#top_posts', as: :user_top_posts
  get 'user_new_posts', to: 'users#new_posts', as: :user_new_posts

  resources :comments

  get 'upvote', to: 'comments#upvote', as: :upvote

  resources :home, only: [:index]

  get 'top_posts', to: 'home#top_posts', as: :top_posts
  get 'my_posts', to: 'home#my_posts', as: :my_posts
  get 'new_posts', to: 'home#new_posts', as: :new_posts
  get 'my_correct_guesses', to: 'home#my_correct_guesses', as: :my_correct_guesses

  resources :guesses

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
