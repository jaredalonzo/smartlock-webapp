require 'uri'
require 'json'
require 'net/http'
class AuthenticationController < ApplicationController
  def create
    user = request.env['omniauth.auth'].to_yaml
    
#    render text: user.to_yaml
  
    puts '
    123
    '

    Rails.logger.info(request.env)

    puts '
    456
    '

    endpoints_uri = 'https://graph.api.smartthings.com/api/smartapps/endpoints'

    puts ' Token is: ' + session[:access_token]

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
    
  end
end
