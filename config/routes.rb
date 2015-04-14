Rails.application.routes.draw do
  resources :events

  resources :galleries, except: [:show]

  resources :blogs

   devise_for :users, :controllers => { registrations: 'registrations' }
   devise_scope :user do

    authenticated :user do
      root 'static_pages#programs', as: :authenticated_root
    end

    unauthenticated do
      root 'static_pages#home', as: :unauthenticated_root
    end
  end

# STATIC ROUTES==============================================
  get '/landing_page' => "static_pages#home", :as => "landing_page"
  get '/coaches' => "static_pages#about",:as => "about_us"
  get '/facilities'=>"static_pages#facilities", :as =>"facilities"
  get '/faqs' => "static_pages#faqs", :as => 'faqs'
  match '/free_trial', to: 'contacts#new', via: 'get',:as => 'trials'
  resources "contacts", only: [:create]
  get '/spartan_programs'=>"static_pages#programs", :as =>"programs"
  get 'tags/:tag', to: 'blogs#index', as: :tag



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
