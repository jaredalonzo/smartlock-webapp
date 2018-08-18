class AuthenticationController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    puts 'hello
    here is auth:
    ' + auth.to_json
  #  code = params[:code]
  #  puts 'Code: ' + code
  #  response = client.auth_code.get_token(code, redirect_uri: 'http://localhost:4567/oauth/callback', scope: 'app')

  #  session[:access_token]

  #  puts 'Token is: ' + session[:access_token]
  #
#    get '/getswitch' do
#      token = session[:access_token]
#
#      endpoints_uri = 'https://graph.api.smartthings.com/api/smartapps/endpoints'
#
#      puts ' Token is: ' + session[:access_token]
#
#    url = URI.parse(endpoints_uri)
#    req = Net::HTTP::Get.new(url.request_uri)
#
#    req['Authorization'] = 'Bearer ' + token
#
#    http = Net::HTTP.new(url.host, url.port)
#    http.use_ssl = (url.scheme == 'https')
#
#    response = http.request(req)
#    json = JSON.parse(response.body)
#
#    puts json

    #response = RestClient::Request.execute(method: :get, url: endpoints_uri, headers: {api_key: token})
#    end
  end

  def get_token
    render text: params[:code]
end
