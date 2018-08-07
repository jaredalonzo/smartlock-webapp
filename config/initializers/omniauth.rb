require 'smartthings'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :smartthings, '8508670b-6f53-4f2a-a9ba-7d0a16d2237f', 'f481de3a-761c-4cda-a1c4-64b68ca98969'
end

