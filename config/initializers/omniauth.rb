require 'smartthings'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :smartthings, '245e659c-4a00-4cf3-b5e8-c351f93c26a4', '622d8e9a-9cc9-4782-91c7-3360d0cfc20b'
end

