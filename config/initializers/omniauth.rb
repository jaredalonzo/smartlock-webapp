module OmniAuth
  module Strategies
    autoload :Smartthings, 'lib/smartthings_strategy'
  end
end

Rails.application.config.middle.use OmniAuth::Builder do
 provider :smartthings, 'secret', 'redirect URL'
end

