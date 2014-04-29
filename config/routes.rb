Rails.application.routes.draw do
  devise_for :users

  root 'dashboards#show'

  resource :dashboard, only: %i(show)
  resources :outlays, only: %i(create)
end
