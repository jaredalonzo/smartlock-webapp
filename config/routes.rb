Rails.application.routes.draw do |map|
  root 'welcome#index'
  get '/oauth/callback' => 'auth#get_token'

  resources :users
end
