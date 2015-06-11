require "webmock/rspec"

require "hubs3d/configuration"

Hubs3D.configure do |c|
  c.oauth_key = "test_key"
  c.oauth_secret = "test_secret"
end
