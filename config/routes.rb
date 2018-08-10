Rails.application.routes.draw do |map|
  root :to => 'welcome#index'

  get '/auth/smartthings/callback' => 'authentication#create'
  resources :users
end
