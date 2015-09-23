Rails.application.routes.draw do



  get 'reservas/crear' => 'reserva#create', :as => 'reserva_cree'
  get 'reserva/' => 'reserva#index'

  #resources se encarga de manejar las rutas del CRUD
  resources :vcubs
  #no tocar estas 3 rutas
  put 'vcubs/:id/posicion' => 'vcubs#cambiar_posicion'
  put 'vcubs/:id/estado' => 'vcubs#cambiar_estado'
  put 'vcubs/:id/prestada' => 'vcubs#cambiar_prestada'

  get 'administrador' => 'usuarios#administrador'

  get 'emergencia/' => 'emergencia#index'
  get 'emergencia/create'
  get 'emergencia/show'
  get 'emergencia/destroy'


  resources :tranvia do

    resources :reportets
  end

  put 'tranvia/:id/posicion' => 'tranvia#cambiar_posicion'
  put 'tranvia/:id/estado' => 'tranvia#cambiar_estado'
  post 'tranvia/:id/emergencia' => 'tranvia#emergencia'
  post 'tranvia/:id/reportar' => 'tranvia#reporte'



  get 'reportets/' => 'reportets#index', :as =>'reportet'
  get 'reportets/create'

  get 'reportems/' => 'reportems#index', :as =>'reportem'
  get 'reportems/create'


  
  resources :mobibuses do
    resources :reportems
  end
  put 'mobibuses/:id/posicion'  => 'mobibuses#cambiar_posicion'
  put 'mobibuses/:id/estado'  => 'mobibuses#cambiar_estado'
  post 'mobibuses/:id/reportar' => 'mobibuses#reporte'
  resources :usuarios
  post 'usuarios/:id/reserva' => 'usuarios#reservar'


  resources :conductors

  post 'conductors/:id/asignarm' => 'conductors#asignarm'

  post 'conductors/:id/asignart' => 'conductors#asignart'

  get 'reportets/create' => 'reportets#create', :as => 'reportets_crear'
  get 'reportems/create' => 'reportems#create', :as => 'reportems_crear'

  resources :reportets

  resources :reportems


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'usuarios#access'

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
