Rails.application.routes.draw do
  resources :disruptions
  root :to => 'disruptions#index'
end
