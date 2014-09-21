Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidetiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :disruptions
  root :to => 'disruptions#index'
end
