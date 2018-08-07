use Rack::Session::Pool, :session_only => false
#use Rack::Session::Cookie, :session_only => false

class ApplicationController < ActionController::Base
  redirect_uri = 'http://localhost:3000/auth/smartthings/callback'

  endpoints_uri = 'https://graph.api.smartthings.com/api/smartapps/endpoints'

  code = params[:code]

  puts 'headers: ' +headers.to_hash.inspect

  response = client.auth_code.get_token(code, redirect_uri: redirect_uri, scope: 'app')

  session[:access_token] = response.token
end
