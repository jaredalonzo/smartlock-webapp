require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class SmartThings < OmniAuth::Strategies::OAuth2
      option :name, 'smartthings'
      option :fields, [:name, :email]
      option :client_options, {
        :site => 'https://graph.api.smartthings.com',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }

      callback_url = 'http://localhost:3000/auth/smartthings/callback'

      def request_phase
        redirect client.auth_code.authorize_url(redirect_uri: callback_url, scope: 'app')
        #form = OmniAuth::Form.new(:title => 'User Info', :url => callback_path)
        #options.fields.each do |field|
          #form.text_field field.to_s.capitalize.gsub('_', ' '), field.to_s
        #end
        #form.button 'Sign In'
        #form.to_response
      end
      
      info do {
        :name => raw_info['name'],
        :email => raw_info['email']
      }
      end

      extra do {
        'raw_info' => raw_info
      }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end
OmniAuth.config.add_camelization 'smartthings', 'SmartThings'
