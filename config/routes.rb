Rails.application.routes.draw do

  # resources :personal_infos
  devise_for :users
  root :to => "system#index"

  get 'system' => 'system#index'
  get 'tadmin' => 'tadmin#index'


  scope module: :system do
    resource :cvs, only: [:show]
    scope module: :cvs do
      resources :personal_infos, only: [:index, :edit, :update]
      resources :education_infos
      resources :career_infos
      resources :skills
      resources :cv_templates
    end

    resource :jobs, only: [:show]
    scope module: :jobs do
      resources :intents
      resources :agents, only: [:index, :show, :edit, :update]
      resources :offers
      resources :applications
      post "offers/:id/apply/:application_id", controller: :offers, action: :apply, as: :offer_apply
    end

  end

  namespace :tadmin do
    resources :agents
  end

  get 'show_cv/:id' => 'extern/show_cv#show', as: :show_cv
  get 'show_cv/:id/what/:what' => 'extern/show_cv#what', as: :show_cv_what






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
