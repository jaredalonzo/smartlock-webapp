require 'net/http'
require 'json'

ENDPOINTS_URI = 'https://graph.api.smartthings.com/api/smartapps/endpoints'

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    token = session[:access_token]
    @user = User.find(params[:id])
    url = URI.parse(ENDPOINTS_URI)
    req = Net::HTTP::Get.new(url.request_uri)

    req['Authorization'] = 'Bearer ' + token

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == 'https')

    response = http.request(req)
    json = JSON.parse(response.body)

    puts json

    uri = json[0]['uri']
    
    puts 'Probing door lock'

    doorURL = uri + '/keys'
    getdoorURL = URI.parse(doorURL)
    getdoorReq = URI.parse(doorURL)
    getdoorReq = Net::HTTP::Get.new(getdoorURL.request_uri)
    getdoorReq['Authorization'] = 'Bearer ' + token
    getdoorHTTP = Net::HTTP.new(getdoorURL.host, getdoorURL.port)
    getdoorHTTP.use_ssl = true

    doorStatus = getdoorHTTP.request(getdoorReq)

    puts doorStatus.body
    
  end
  
  def new
    token = session[:access_token]
    @user = User.new
  end

  def edit
    token = session[:access_token]
    @user = User.find(params[:id])
  end

  def create 
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :code)
  end
end
