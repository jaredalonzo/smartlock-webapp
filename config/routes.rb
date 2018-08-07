require 'json'
require 'net/http'
require 'uri'

Rails.application.routes.draw do
  resources :users
  root to: redirect('/auth/smartthings')

  get 'oauth/callback' => 'application#authentication_callback'
end
