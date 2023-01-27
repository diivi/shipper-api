Rails.application.routes.draw do
  resources :shippings
  resources :items
  resources :categories
  resources :warehouses
  devise_for :businesses,
  controllers: {
    sessions: 'businesses/sessions',
    registrations: 'businesses/registrations'
  },
  defaults: { format: :json }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
