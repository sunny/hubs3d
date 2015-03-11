require "minitest/autorun"
require "webmock/minitest"

require "hubs3d"

Hubs3D.configure do |c|
  c.oauth_key = "test_key"
  c.oauth_secret = "test_secret"
end
