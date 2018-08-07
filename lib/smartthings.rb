require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class SmartThings < OmniAuth::Strategies::OAuth2
      option :name, 'smartthings'
      option :client_options, {
        :site => 'https://graph.api.smartthings.com',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }
    end
  end
end
OmniAuth.config.add_camelization 'smartthings', 'SmartThings'
