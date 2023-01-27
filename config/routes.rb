Rails.application.routes.draw do
  devise_for :businesses,
  controllers: {
    sessions: 'businesses/sessions',
    registrations: 'businesses/registrations'
  },
  defaults: { format: :json }
  devise_for :admins
  resources :shippings
  resources :categories
  resources :warehouses do
    resources :items
  end
  get 'admin/shipping_requests', to: 'admin#shipping_requests'
  get 'admin/shippings', to: 'admin#shippings'
  patch 'admin/update_shipping_price/:id', to: 'admin#update_shipping_price'
  patch 'admin/update_shipping_status/:id', to: 'admin#update_shipping_status'
  patch 'admin/update_shipping_location/:id', to: 'admin#update_shipping_location'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
