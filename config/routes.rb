Rails.application.routes.draw do |map|
  #get '/auth/:provider/callback' => 'authentication#create'
  root :to => 'welcome#index'
  get '/oauth/callback', :to => 'authentication#create'

  resources :users
end
