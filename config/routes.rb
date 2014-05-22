Rails.application.routes.draw do
  root 'dashboards#show'

  devise_for :users, controllers: {registrations: 'registrations'}

  resources :outlays, only: %i(create destroy)
  resources :expense_items, only: %i(index create destroy)

  match '*path' => redirect(?/), via: [:get, :post] if Rails.env.production?
end
