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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
