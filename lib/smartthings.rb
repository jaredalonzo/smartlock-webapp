require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class SmartThings < OmniAuth::Strategies::OAuth2
      option :name, 'smartthings'
      option :client_options, {
        :site => 'https://graph.api.smartthings.com',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token',
        :scope => 'app'
      }

      def request_phase
        redirect client.auth_code.authorize_url(redirect_uri: 'http://localhost:4567/oauth/callback', scope: 'app')
      end

      def build_access_token
        verifier = request.params['code']
        response = client.auth_code.get_token(verifier, redirect_uri: 'http://localhost:4567/oauth/callback', scope: 'app')

        session[:access_token] = response.token
      end
      
    end
  end
end
OmniAuth.config.add_camelization 'smartthings', 'SmartThings'
