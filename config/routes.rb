Rails.application.routes.draw do
  root 'dashboards#show'

  devise_for :users, controllers: {registrations: 'registrations'}

  resource :dashboard, only: %i(show)
  resources :outlays, only: %i(create)
end
