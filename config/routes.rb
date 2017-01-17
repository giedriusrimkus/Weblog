Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  # get 'users/index'
  get '/contact', to: 'messages#new', as: 'contact'
  post '/contact', to: 'messages#create'

  get '/about', to: 'pages#about'

  devise_for :users

  resources :posts do
    resources :comments
  end

  # resources :post_attachments

  root to: "posts#index"
  match 'posts/:id/publish' => 'posts#publish', :via => :get, :as => :publish_post
  match 'posts/:id/unpublish' => 'posts#unpublish', :via => :get, :as => :unpublish_post

  get 'tags/:tag', to: 'posts#index', as: "tag"
  get 'tags/', to: 'tags#index', as: "tags"
  get 'taggings/', to: 'taggings#index', as: "taggings"
  match 'taggings/:id' => 'taggings#destroy', :via => :delete, :as => :delete_tagging
  match 'tags/:id' => 'tags#destroy', :via => :delete, :as => :delete_tag

  match '/users',   to: 'users#index',   via: 'get'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  match 'users/:id' => 'users#show', :via => :get, :as => :admin_show_user
  match 'users/:id' => 'users#update', :via => :get, :as => :admin_edit_user

  match '/comments',   to: 'comments#index',   via: 'get', :as => :all_comments
  match '/comments/:id',   to: 'comments#show',   via: 'get', :as => :show_comment

  #resources "contacts", only: [:new, :create]
  #match '/contacts',   to: 'contacts#new',   via: 'get'
  #match '/contact',   to: 'contacts#new',   via: 'get'

  devise_scope :user do
    get "/admin" => "devise/sessions#new"
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
