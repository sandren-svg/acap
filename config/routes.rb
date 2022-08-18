Rails.application.routes.draw do
  namespace :client, path: '/client', controller: 'client' do
    resources :vouchers
    resources :merchants
    resources :credits
  end

  get '/health_check', to: 'health_check#show'
end
