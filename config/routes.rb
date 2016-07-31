Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  get '/auth/failure', to: 'sessions#failure'
  get '/auth/:provider/callback', to: 'sessions#create'
end
