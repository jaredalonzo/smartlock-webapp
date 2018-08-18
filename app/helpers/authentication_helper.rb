module AuthenticationHelper
  CLIENT_ID = '245e659c-4a00-4cf3-b5e8-c351f93c26a4' 
  CLIENT_SECRET = '622d8e9a-9cc9-4782-91c7-3360d0cfc20b'
  REDIRECT_URI = 'http://localhost:4567/oauth/callback'

  def get_login_url
    client = OAuth2::Client.new(CLIENT_ID,
                                CLIENT_SECRET,
                                :site => 'https://graph.api.smartthings.com',
                                :authorize_url => '/oauth/authorize',
                                :token_url => '/oauth/token'
                               )

    login_url = client.auth_code.authorize_url(:redirect_uri => authorize_url, :scope => 'app')

    
  end
end
