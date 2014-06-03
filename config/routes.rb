Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'dashboards#show'

  devise_for :users, controllers: {registrations: 'registrations'}

  resources :outlays, only: %i(create destroy)
  get '/:year/:month' => 'outlays#index', as: 'month_outlays', constraints: {year: /[1-9][0-9]{3}/, month: /[01][0-9]/}
  resources :expense_items, only: %i(index create destroy)

  match '*path' => redirect(?/), via: [:get, :post] if Rails.env.production?
end
