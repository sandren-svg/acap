Rails.application.routes.draw do
  namespace :client, path: '/client', controller: 'client' do
    resources :vouchers
    resources :users
    resources :merchants
    resources :credits
  end
end
