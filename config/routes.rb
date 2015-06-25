Rails.application.routes.draw do

  resources :badges

  resources :extras do
    collection do
      put 'add_multiple'
    end
  end

  resources :partextras do
    collection do
      delete 'rem_multiple'
    end
  end


  resources :participants do 
    collection {post :import}
  end 

  resources :extras

  get 'home/index'
  get 'home/statistics'


  resources :tickets

  get '/participants/:id/addExtras', to: 'participants#addExtras', as: 'addExtras'
  get '/participants/:id/remExtras', to: 'participants#remExtras', as: 'remExtras'


  root 'home#index'

  Rails.application.routes.draw do
  resources :badges

    resources :users, controller: 'users', only: Clearance.configuration.user_actions
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
