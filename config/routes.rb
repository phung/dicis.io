DicisIo::Application.routes.draw do
  #devise_for :leaders
  resources :users

  resources :options

  resources :votes

  resources :events do
    resources :options
  end
  
  get '/:id/updated_results' => "events#updated_result"
  get '/:id/vote' => "votes#index"
  #post '/events/:id/getOptions' => "events#getOptions"
  post '/:id/update-options' => "events#update_2"
  post '/:id/add-option' => "events#add"
  
  post '/:id/submit-votes' => "votes#submit"
  get '/:id/results' => "events#result"
  #get '/login' => "home#login"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  
  get '/main' => "home#main"
  
  get '/newevent' => "events#main"
  
  devise_for :leaders, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }
  get 'leaders/sign_in' => 'home#login'
  
  get '/:id' => "events#getOptions"
  
  #get '/events/:id/options' => 'options/'
  #devise_scope :leader do
  #  get "/login" => "devise/sessions#new"
  #end
  
  #devise_scope :leader do
  #  delete "/logout" => "devise/sessions#destroy"
  #end

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
