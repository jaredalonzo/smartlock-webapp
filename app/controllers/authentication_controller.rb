class AuthenticationController < ApplicationController
  def create
    #user = request.env['omniauth.auth']
    #response = client.auth_code.get_token

    puts params[:code].to_s

    session[:access_token] = params[:code]

    puts session[:access_token].to_s
  end
end
