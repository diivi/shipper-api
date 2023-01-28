Rails.application.routes.draw do
  devise_for :businesses,
  controllers: {
    sessions: 'businesses/sessions',
    registrations: 'businesses/registrations'
  },
  defaults: { format: :json }
  devise_for :admins,
  controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  },
  defaults: { format: :json }
  resources :shippings
  resources :categories
  resources :warehouses do
    resources :items
  end
  get 'admin/shipping_requests', to: 'admin#shipping_requests'
  get 'admin/shippings', to: 'admin#shippings'
  post 'admin/update_shipping_price/:id', to: 'admin#update_shipping_price'
  post 'admin/update_shipping_status/:id', to: 'admin#update_shipping_status'
  post 'admin/update_shipping_location/:id', to: 'admin#update_shipping_location'
  get 'business/items', to: 'business#items'
  get 'distance', to: 'distance#distance_to_india'
  # public api for businesses /public/
  scope '/public' do
    get 'warehouses', to: 'public#warehouses'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
